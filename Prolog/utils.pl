:-style_check(-discontiguous).
:-style_check(-singleton).

ler_arquivo(Arquivo, Listas) :-
    atom_concat('./dados/', Arquivo, Path),
    csv_read_file(Path, Linhas, []),
    rows_to_lists(Linhas, Listas).

rows_to_lists(Linhas, Listas):-
    maplist(row_to_list, Linhas, Listas).

row_to_list(Linha, Lista):-
    Linha =.. [row|Lista].

verifica_id(_, [], false).
verifica_id(Busca, [H|_], true) :- H = [Id|_], Busca = Id.
verifica_id(Busca, [_|T], R) :- verifica_id(Busca, T, R).

edita_lista_csv([], _, _, _, _, []).
edita_lista_csv([row(Id,_,Usuario,Status,_,_,_)|T], Id, NovoNome, NovaUrgencia, NovaDificuldade, NovaEntrega, [row(Id,NovoNome,Usuario,Status,NovaUrgencia,NovaDificuldade,NovaEntrega)|T]).
edita_lista_csv([H|T], Id, NovoNome, NovaUrgencia, NovaDificuldade, NovaEntrega, [H|Out]) :- edita_lista_csv(T, Id, NovoNome, NovaUrgencia, NovaDificuldade, NovaEntrega, Out).

edita_lista(IdAtividade, NovoNome, NovaUrgencia, NovaDificuldade, NovaEntrega) :-
    atom_concat('./dados/', 'atividades.csv', Path),
    csv_read_file(Path, File),
    edita_lista_csv(File, IdAtividade, NovoNome, NovaUrgencia, NovaDificuldade, NovaEntrega, Saida),
    csv_write_file(Path, Saida).

edita_status_csv([], _, _, []).
edita_status_csv([row(Id,Nome,Usuario,_,Urgencia,Dificuldade,Entrega)|T], Id, NovoStatus, [row(Id,Nome,Usuario,NovoStatus,Urgencia,Dificuldade,Entrega)|T]).
edita_status_csv([H|T], Id, NovoStatus, [H|Out]) :- edita_status_csv(T, Id, NovoStatus, Out).

edita_status(IdAtividade, NovoStatus) :-
    atom_concat('./dados/', 'atividades.csv', Path),
    csv_read_file(Path, File),
    edita_status_csv(File, IdAtividade, NovoStatus, Saida),
    csv_write_file(Path, Saida).

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
    (StatusAtom = 'A fazer';
     StatusAtom = 'Em andamento';
     StatusAtom = 'Concluida').


verifica_dificuldade(Dificuldade) :-
    atom_string(DificuldadeAtom, Dificuldade),
    (DificuldadeAtom = 'Facil';
     DificuldadeAtom = 'Medio';
     DificuldadeAtom = 'Dificil').

escolherOpcao(1) :- usuario.
escolherOpcao(2) :- atividade.
escolherOpcao(3) :- exibir_quadro.
escolherOpcao(4) :- editar_atividade.
escolherOpcao(5) :- editar_status.
escolherOpcao(6) :- halt.
escolherOpcao(_) :- writeln('Opção inválida!'), main.