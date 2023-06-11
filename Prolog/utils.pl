escolherOpcao(1) :- usuario, !.
escolherOpcao(2) :- atividade, !.
escolherOpcao(3) :- exibir_quadro, !.
escolherOpcao(4) :- editar_atividade, !.
escolherOpcao(5) :- editar_status, !.
escolherOpcao(6) :- halt.
escolherOpcao(_) :- writeln('Opção inválida!'), main.

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

verifica_status(Status) :-
    atom_string(StatusAtom, Status),
    (
        StatusAtom = 'A fazer' ;
        StatusAtom = 'Em andamento' ;
        StatusAtom = 'Concluida'
    ).


verifica_dificuldade(Dificuldade) :-
    atom_string(DificuldadeAtom, Dificuldade),
    (
        DificuldadeAtom = 'Facil' ;
        DificuldadeAtom = 'Medio' ;
        DificuldadeAtom = 'Dificil'
    ).

    %ler_numero(Status).