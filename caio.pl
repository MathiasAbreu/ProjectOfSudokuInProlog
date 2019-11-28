random_line(L) :-
length(L,9),
random_between(1,9,E1),
random_between(1,9,E2),
random_between(1,9,E3),
random_between(1,9,E4),
random_between(1,9,E5),
random_between(1,9,E6),
random_between(1,9,E7),
random_between(1,9,E8),
random_between(1,9,E9),
nth1(1,L,E1),
nth1(2,L,E2),
nth1(3,L,E3),
nth1(4,L,E4),
nth1(5,L,E5),
nth1(6,L,E6),
nth1(7,L,E7),
nth1(8,L,E8),
nth1(9,L,E9).

get_element_matrix(M,L,C,E) :-
nth1(L,M,A),
nth1(C,A,E).