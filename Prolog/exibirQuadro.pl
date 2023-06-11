/*exibir_quadro:-
  writeln('+-------------------------------------------------------------------+'),
  writeln('|                        Quadro de Atividades                       |'),
  writeln('+-------------------------------------------------------------------+'),
  writeln('| A fazer: '),
  writeln('| Em andamento: '),
  writeln('| Concluídas: '),
  main.*/

exibir_quadro :-
    writeln('+-------------------------------------------------------------------+'),
    writeln('|                        Quadro de Atividades                       |'),
    writeln('+-------------------------------------------------------------------+'),
    writeln('| A fazer: '),
    exibir_atividades_por_status('A fazer'),
    writeln('| Em andamento: '),
    exibir_atividades_por_status('Em andamento'),
    writeln('| Concluídas: '),
    exibir_atividades_por_status('Concluídas'),
    main.

exibir_atividades_por_status(Status) :-
    ler_arquivo('atividades.csv', Atividades),
    exibir_atividades_filtradas(Atividades, Status).

exibir_atividades_filtradas([], _).
exibir_atividades_filtradas([Atividade|Resto], Status) :-
    term_string(Atividade, AtividadeString),
    split_string(AtividadeString, ",", "", [Id, Nome, Usuario, StatusAtividade, Urgencia, Dificuldade, Entrega]),
    trim_string(Id, IdTrimmed),
    trim_string(Nome, NomeTrimmed),
    trim_string(Usuario, UsuarioTrimmed),
    trim_string(StatusAtividade, StatusTrimmed),
    trim_string(Urgencia, UrgenciaTrimmed),
    trim_string(Dificuldade, DificuldadeTrimmed),
    trim_string(Entrega, EntregaTrimmed),
    (StatusTrimmed = Status ->
        writeln('| ID: ', IdTrimmed),
        writeln('| Nome: ', NomeTrimmed),
        writeln('| Usuário: ', UsuarioTrimmed),
        writeln('| Status: ', StatusTrimmed),
        writeln('| Urgência: ', UrgenciaTrimmed),
        writeln('| Dificuldade: ', DificuldadeTrimmed),
        writeln('| Entrega: ', EntregaTrimmed),
        writeln('|-----------------------------'),
        fail
    ;
        true
    ),

    exibir_atividades_filtradas(Resto, Status).
