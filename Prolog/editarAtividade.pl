:- dynamic atividade/6.  % Definição dinâmica do predicado atividade/6
:- use_module(library(pcre)).

editarAtividade(IdAtividade, NovoNome, NovaDificuldade, NovaUrgencia, NovaEntrega) :-
    retract(atividade(IdAtividade, NomeAtividade, Dificuldade, Urgencia, Entrega, Status)),
    NovoNomeFinal = (NovoNome ; NomeAtividade),
    NovaDificuldadeFinal = (NovaDificuldade ; Dificuldade),
    NovaUrgenciaFinal = (NovaUrgencia ; Urgencia),
    NovaEntregaFinal = (NovaEntrega ; Entrega),
    assertz(atividade(IdAtividade, NovoNomeFinal, NovaDificuldadeFinal, NovaUrgenciaFinal, NovaEntregaFinal, Status)).

editarStatus(IdAtividade, NovoStatus) :-
    retract(atividade(IdAtividade, NomeAtividade, Dificuldade, Urgencia, Entrega, Status)),
    NovoStatusFinal = (NovoStatus ; Status),
    assertz(atividade(IdAtividade, NomeAtividade, Dificuldade, Urgencia, Entrega, NovoStatusFinal)).

gerar_matriz_atividades(NomeArquivo, MatrizAtividades) :-
    read_file_lines(NomeArquivo, Linhas),
    maplist(processar_linha, Linhas, MatrizAtividades).

processar_linha(Linha, Atividade) :-
    regex("^ID: (\\d+), NOME: (.+), USUÁRIO: (\\d+), STATUS: (\\d+), URGÊNCIA: (\\d+), DIFICULDADE: ([^,]+), ENTREGA: ([^,]+)$", [], Linha, Capturas),
    [_, Id, Nome, Usuario, Status, Urgencia, Dificuldade, Entrega] = Capturas,
    Atividade = [Id, Nome, Usuario, Status, Urgencia, Dificuldade, Entrega].

read_file_lines(File, Lines) :-
    setup_call_cleanup(open(File, read, In),
                       read_lines(In, Lines),
                       close(In)).

read_lines(Stream, [Line|Lines]) :-
    read_line_to_string(Stream, Line),
    (Line \== end_of_file ->
        read_lines(Stream, Lines)
    ;
        Lines = []).
