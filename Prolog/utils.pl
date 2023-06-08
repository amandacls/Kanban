ler_string(X) :-
    read_line_to_codes(user_input, R),
    atom_string(R, X).

ler_numero(N) :-
    read_line_to_codes(user_input, R),
    atom_string(R, X),
    atom_number(X, N).

verifica_opcao(1) :- true, !.
verifica_opcao(2) :- true, !.
verifica_opcao(3) :- true, !.
verifica_opcao(4) :- true, !.
verifica_opcao(_) :- false, !.

verifica_status(1) :- true.
verifica_status(2) :- true.
verifica_status(3) :- true.
verifica_status(_) :- false.
