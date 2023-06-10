ler_arquivo(Arquivo, Lists):-
    atom_concat('./dados/', Arquivo, Path),
    csv_read_file(Path, Linhas, []),
    linhas_em_listas(Linhas, Listas).

linhas_em_listas(Linhas, Listas):-
    maplist(linha_em_lista, Linhas, Listas).

linha_em_lista(Linha, Lista):-
    Linha =.. [linha|Lista].

verifica_id(_, [], false).
verifica_id(Busca, [H|T], R):-
    (member(Busca, H) -> R = true;
    verifica_id(Busca, T, R)).

altera(_, [], false).
altera(Id, [H|T], R):-
    (verifica_id(Id, H);
    altera(Id, T, R)).

remove(X, [X|T], T).
remove(X, [H|T], [H|T1]):-
    remove(X, T, T1).

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