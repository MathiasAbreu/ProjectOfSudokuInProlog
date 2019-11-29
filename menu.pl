:- module('menu', [iniciaMenu/0]).


iniciaMenu() :-
        clear(),
        writeln("*****************************"),
        writeln('********** SUDOKU ***********'),
        writeln('*****************************'),
        opcoes.


opcoes() :-
            writeln('1. Gerar Sudoku'              ),
            writeln('2. Resolvedor de sudokus'     ),
            writeln('3. Sair'                      ),
            writeln('Escolha uma opçao (3 para sair): ') read(Opcao),
            escolheOpcao(Opcao).

escolheOpcao(1) :- write('Metodo de gerar o sudoku').
escolheOpcao(2) :- write('Resolvedor de sudoku').
escolheOpcao(3) :- true;
escolheOpcao(_) :- write('Opçao invalida, tente novamente.'), opcoes.

escolheCoordenadas(SudokuGerado) :- mostrarSudoku(SudokuGerado),
									write('Escolha a linha (0 para desistir): '),
									read(Linha), nl,
									write('Escolha a coluna (0 para desistir): '),
									read(Coluna), nl,
									write('Insira o numero: '),
									read(Numero), nl,
									verificaCoordenadas(SudokuGerado, Linha,Coluna,Numero).

verificaCoordenadas(SudokuGerado ,Linha, Coluna, Numero) :- Linha == 0, Coluna == 0, verificaDesistencia (SudokuGerado,-1,-1, Numero);


verificaDesistencia(Matriz (-1) (-1) Numero, Retorno) =  Retorno is backTrackingResolution(Matriz (0,0) 1).
verificaDesistencia(Matriz, Linha, Coluna, Numero, Retorno) = Retorno is adicionaElementoPosicao Matriz (0,0) (Linha,Coluna) Numero)
