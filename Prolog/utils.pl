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

exibe_matriz :-
    writeln('Matriz de Eisenhower:'),
    writeln('+----------------+----------------+'),
    writeln('| Urgente e      | Importante e   |'),
    writeln('| importante     | não urgente    |'),
    writeln('+----------------+----------------+'),
    writeln('| Não urgente e  | Não importante |'),
    writeln('| importante     | e urgente      |'),
    writeln('+----------------+----------------+'),
    writeln('Escolha o grau de urgência:'),
    writeln('1 - Urgente e importante'),
    writeln('2 - Importante e não urgente'),
    writeln('3 - Não importante e urgente'),
    writeln('4 - Não urgente e não importante'),
    writeln('Opção: ').

exibir_status :-
    writeln('Status:'),
    writeln('Status possiveis: A fazer | Em andamento | Concluído'),
    writeln('Adicione um desses status a sua atividade: ').
    %ler_numero(Status).