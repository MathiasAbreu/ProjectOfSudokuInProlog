:- initialization main.

main():-
  read(Sudoku),
  mostrarSudoku(Sudoku).
  /*iniciaMenu(),
  halt(0).*/

sudoku([[_,6,_,_,_,5,_,_,_],
        [_,7,_,_,_,_,_,_,1],
        [_,_,_,_,6,3,4,_,_],
        [_,_,3,_,8,_,_,_,_],
        [2,1,_,_,9,_,_,_,5],
        [4,_,_,_,_,7,8,_,_],
        [_,_,1,6,_,_,_,8,4],
        [_,_,_,_,_,_,_,5,_],
        [8,_,_,_,4,_,6,1,_]]).


mostrarSudoku([Head|[]]):- mostrarLinha(Head).
mostrarSudoku([Head|Tail]):- mostrarLinha(Head),mostrarSudoku(Tail).

mostrarDivisoria():- writeln("--------------------------------------------").
mostrarLinha([Head|[]]):- write(" | "), write(Head), writeln(" |").
mostrarLinha([Head|Tail]):- write(" | "), write(Head), mostrarLinha(Tail).
