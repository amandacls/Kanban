:- include('utils.pl').

exibir_quadro :-
    writeln('+-------------------------------------------------------------------+'),
    writeln('|                        Quadro de Atividades                       |'),
    writeln('+-------------------------------------------------------------------+'),
    exibir_dados_csv('./dados/atividades.csv'),
    main.

exibir_dados_csv(NomeArquivo) :-
    open(NomeArquivo, read, Stream),
    ler_linhas(Stream, Linhas),
    close(Stream),
    exibir_linhas(Linhas).

ler_linhas(Stream, Linhas) :-
    read_line_to_codes(Stream, Line),
    (Line \= end_of_file ->
        atom_codes(AtomLine, Line),
        split_string(AtomLine, ",", "", Linha),
        Linhas = [Linha | Resto],
        ler_linhas(Stream, Resto)
    ;
        Linhas = []
    ).

exibir_linhas([]).
exibir_linhas([Linha | Resto]) :-
    exibir_elemento(Linha),
    writeln('+-------------------------------------------------------------------+'),
    exibir_linhas(Resto).

exibir_elemento([Id, Nome, Usuario, Status, Urgencia, Dificuldade, Entrega]) :-
    format('| ID ATIVIDADE:  ~w~n', [Id]),
    format('| NOME:  ~w~n', [Nome]),
    format('| ID USUÁRIO:  ~w~n', [Usuario]),
    format('| STATUS:  ~w~n', [Status]),
    format('| URGÊNCIA:  ~w~n', [Urgencia]),
    format('| DIFICULDADE:  ~w~n', [Dificuldade]),
    format('| ENTREGA:  ~w~n', [Entrega]).

trim_string(String, Trimmed) :-
    atom_string(Atom, String),
    atom_string(Trimmed, Atom).