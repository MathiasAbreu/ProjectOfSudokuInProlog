menu :- write('***************************** \n'),
        write('********** SUDOKU ***********'), nl,
        write('*****************************'), nl
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
