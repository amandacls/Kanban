ler_string(X) :-
    read_line_to_codes(user_input, R),
    atom_string(R, X).

ler_numero(N) :-
    read_line_to_codes(user_input, R),
    atom_string(R, X),
    atom_number(X, N).