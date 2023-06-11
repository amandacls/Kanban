atividade :-
    write('Insira o ID da atividade: '),
    ler_string(IdAtv),
    write('Insira o nome da atividade: '),
    ler_string(Tarefa),
    write('Insira o ID do usuário: '),
    ler_numero(IdUsuario),
    writeln('Status possíveis: A fazer | Em andamento | Concluída'),
    add_status(IdAtv, Tarefa, IdUsuario).

add_status(IdAtv, Tarefa, IdUsuario) :-
    write('Adicione um desses status a sua atividade: '),
    ler_string(Status),
    (verifica_status(Status) ->
        add_urgencia(IdAtv, Tarefa, IdUsuario, Status)
    ;
        writeln('Entrada inválida, por favor escolha um status solicitado.'),
        add_status(IdAtv, Tarefa, IdUsuario)
    ).

add_urgencia(IdAtv, Tarefa, IdUsuario, Status) :-
    write('Grau de urgência: '),
    write('Você precisa de ajuda com o grau de urgência? (S para sim, N para não) '),
    ler_string(UrgenciaStr),
    (UrgenciaStr = "S" ->
        exibe_matriz(IdAtv, Tarefa, IdUsuario, Status),
        repeat,
        ler_numero(Entrada),
        (verifica_opcao(Entrada) ->
            writeln('Entrada inválida, por favor, digite uma opção.'),
            fail
        ;
            add_dificuldade(IdAtv, Tarefa, IdUsuario, Status, Entrada)
        )
    ;
        (UrgenciaStr = "N" -> add_dificuldade(IdAtv, Tarefa, IdUsuario, Status, 0))
    ).

add_urgencia(IdAtv, Tarefa, IdUsuario, Status) :-
    writeln('Opção inválida, por favor escolha S ou N.'),
    add_urgencia(IdAtv, Tarefa, IdUsuario, Status).

exibe_matriz(IdAtv, Tarefa, IdUsuario, Status) :-
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
    writeln('Opção: '),
    ler_numero(Opcao),
    (verifica_opcao(Opcao) ->
        add_dificuldade(IdAtv, Tarefa, IdUsuario, Status, Opcao)
    ;
        writeln('Entrada inválida, por favor, digite uma opção válida.'),
        exibe_matriz(IdAtv, Tarefa, IdUsuario, Status)
    ).

add_dificuldade(IdAtv, Tarefa, IdUsuario, Status, Entrada) :-
    writeln('Dificuldade: Fácil | Médio | Difícil'),
    writeln('Adicione um desses níveis de dificuldade a sua atividade: '),
    ler_string(DificuldadeStr),
    (verifica_dificuldade(DificuldadeStr) ->
        add_data(IdAtv, Tarefa, IdUsuario, Status, Entrada, DificuldadeStr)
    ;
        writeln('Entrada inválida, por favor escolha uma opção de dificuldade válida.'),
        add_dificuldade(IdAtv, Tarefa, IdUsuario, Status, Entrada)
    ).


add_data(IdAtv, Tarefa, IdUsuario, Status, Entrada, Dificuldade) :-
    write('Data de entrega: '),
    ler_string(Data),
    cadastrar_atividade(IdAtv, Tarefa, IdUsuario, Status, Entrada, Dificuldade, Data),
    writeln('Atividade cadastrada com sucesso! \n'),
    main.


cadastrar_atividade(Id, Nome, Usuario, Status, Urgencia, Dificuldade, Entrega) :-
    format(atom(Line), 'ID: ~w, NOME: ~w, USUÁRIO: ~w, STATUS: ~w, URGÊNCIA: ~w, DIFICULDADE: ~w, ENTREGA: ~w\n', [Id, Nome, Usuario, Status, Urgencia, Dificuldade, Entrega]),
    open('./dados/atividades.csv', append, Stream),
    write(Stream, Line),
    close(Stream).

% Refatorar em funções separadas e realizar verificações