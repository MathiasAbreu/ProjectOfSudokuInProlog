:-use_module(library(clpfd)).

solve() :-
    board(Linhas),
    sudoku(Linhas),
    maplist(portray_clause, Linhas).

generate() :-
    random_line(L),
    generatedBoard(Linhas),
    nth1(1,Linhas,L),
    sudoku(Linhas),
    maplist(label, Linhas),
    zeraCelulas(Linhas, 0, M),
    maplist(portray_clause, M).

random_line(L) :-
    random_permutation([1,2,3,4,5,6,7,8,9],L).

index(Matrix, Row, Col, Value):-
  nth1(Row, Matrix, MatrixRow),
  nth1(Col, MatrixRow, Value).

replaceElementM(R, C, Mat, Val, Upd) :-
    nth1(R, Mat, OldRow, RestRows),   
    nth1(C, OldRow, _Val, NewRow),    
    nth1(C, NewRowUpd,Val,NewRow),	
    nth1(R, Upd, NewRowUpd, RestRows).

zeraCelulas(MatrizJogadorCopiada,15,MatrizJogador):-
	MatrizJogador = MatrizJogadorCopiada.
	
zeraCelulas(MatrizJogadorCopiada,NumCelulasZeradas,MatrizJogador):-
	random_between(1, 9, Row),
	random_between(1, 9, Col),
	index(MatrizJogadorCopiada_,Row,Col,Valor),
	(Valor == 0 -> zeraCelulas(MatrizJogadorCopiada_,NumCelulasZeradas,MatrizJogador);
								replaceElementM(Row,Col,MatrizJogadorCopiada,_,MatrizJogadorCopiada_),NewNumCelulas is (NumCelulasZeradas + 1)
								,zeraCelulas(MatrizJogadorCopiada_,NewNumCelulas,MatrizJogador)).

board(
    [[_,6,_,_,_,5,_,_,_],
     [_,7,_,_,_,_,_,_,1],
     [_,_,_,_,6,3,4,_,_],
     [_,_,3,_,8,_,_,_,_],
     [2,1,_,_,9,_,_,_,5],
     [4,_,_,_,_,7,8,_,_],
     [_,_,1,6,_,_,_,8,4],
     [_,_,_,_,_,_,_,5,_],
     [8,_,_,_,4,_,6,1,_]]).

generatedBoard(
    [[_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_]]).

sudoku(Linhas) :-
    length(Linhas, 9),  /*São 9 linhas*/
    maplist(same_length(Linhas), Linhas), /*Todas as linhas tem 9 elementos*/
    append(Linhas, Vs), Vs ins 1..9,
    maplist(all_distinct, Linhas), /*Todas as linhas tem valores distintos*/
    transpose(Linhas, Colunas), /*Linhas transpostas viram as colunas*/
    maplist(all_distinct, Colunas), /*Todas as colunas tem valores distintos*/
    Linhas = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
    secoes(As, Bs, Cs),
    secoes(Ds, Es, Fs),
    secoes(Gs, Hs, Is).

secoes([], [], []).
secoes([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
    all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
    secoes(Ns1, Ns2, Ns3).
