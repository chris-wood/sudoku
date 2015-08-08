all_different([E1, E2, E3, E4]) :-
  E1 =\= E2, E1 =\= E3, E1 =\= E4, E2 =\= E3, E2 =\= E4, E3 =\= E4.

valid([]).
valid([Head|Tail]) :-
  all_different(Head),
  valid(Tail).

valid_domain([], Min, Max).
valid_domain([Head|Tail], Min, Max) :- 
  Head =< Max, Head >= Min, valid_domain(Tail, Min, Max).

sudokuGame(Puzzle, Solution) :- 

  Solution = Puzzle,
  Puzzle = [S11, S12, S13, S14,
            S21, S22, S23, S24,
            S31, S32, S33, S34,
            S41, S42, S43, S44],

  valid_domain(Solution, 1, 4),

  Row1 = [S11, S12, S13, S14],
  Row2 = [S21, S22, S23, S24],
  Row3 = [S31, S32, S33, S34],
  Row4 = [S41, S42, S43, S44],

  Col1 = [S11, S21, S31, S41],
  Col2 = [S12, S22, S32, S42],
  Col3 = [S13, S23, S33, S43],
  Col4 = [S14, S24, S34, S44],

  Sqr1 = [S11, S12, S21, S22],
  Sqr2 = [S13, S14, S23, S24],
  Sqr3 = [S31, S32, S41, S42],
  Sqr4 = [S33, S34, S43, S44],

  valid([Row1, Row2, Row3, Row4,
         Col1, Col2, Col3, Col4,
         Sqr1, Sqr2, Sqr3, Sqr4]).

main :-
  sudokuGame([_,_,2,3,_,_,_,_,_,_,_,_,3,4,_,_], X).
