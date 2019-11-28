menu :- write('***************************** \n'),
        write('********** SUDOKU ***********'), nl,
        write('*****************************'), nl,
        opcoes.


opcoes :-   write('1. Gerar Sudoku'              ), nl,
            write('2. Resolvedor de sudokus'     ), nl,
            write('3. Sair'                      ), nl,
            write('Escolha uma opçao (3 para sair): ') read(Opcao),
            escolheOpcao(Opcao).

escolheOpcao(Opcao) :- Opcao == 1, write('Metodo de gerar o sudoku');
                       Opcao == 2, write('Resolvedor de sudoku');
                       Opcao == 3, true;
                       Opcao == _, write('Opçao invalida, tente novamente.'), opcoes.
                       
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
                       


