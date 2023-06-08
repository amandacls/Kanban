ler_string(X) :-
    read_line_to_codes(user_input, R),
    atom_string(R, X).

ler_numero(N) :-
    read_line_to_codes(user_input, R),
    atom_string(R, X),
    atom_number(X, N).

verifica_opcao(Opcao, Elem):-
    Elem is ['1', '2', '3', '4'],
    atom_string(Elem, R),
    member(Opcao, R).

verifica_status(A fazer):- true, !.
verifica_status(Em andamento):- true, !.
verifica_status(Concluido):- true, !.
verifica_status(_):- false, !.