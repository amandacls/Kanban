atividade :-
    write('Insira o ID da atividade: '),
    ler_string(IdAtv),
    writeln('Tarefa:' ),
    write('Insira o nome: '),
    ler_string(Tarefa),
    write('Usuario: '),
    ler_string(IdUsuario),
    writeln('Status:'),
    writeln('Status possiveis: A fazer | Em andamento | Concluida'),
    write('Adicione um desses status a sua atividade: '),
    ler_string(Status),
    (\+ verifica_status(Status) -> writeln('Entrada inválida, por favor escolha uma das opções solicitadas.'),
    atividade
    ; write('Grau de urgência: '), 
      write('Você precisa de ajuda com o grau de urgência? (1 para sim, 0 para não) '), 
      ler_numero(Urgencia),
      (Urgencia = 1 -> 
        exibe_matriz,
        ler_numero(Entrada),
        (verifica_opcao(Entrada) -> writeln('Dificuldade: '),
        writeln('Facil | Medio | Dificil'),
        write('Adicione um desses níveis de dificuldade a sua atividade: '),
        ler_string(Dificuldade),
        % Verificar dificuldade

        write('Data de entrega: '),
        ler_string(Data),
        cadastrar_atividade(IdAtv, Tarefa, IdUsuario, Status, Entrada, Dificuldade, Data),
        writeln('Atividade cadastrada com sucesso! \n'),
        main;
        writeln('Entrada inválida, por favor escolha uma das opções solicitadas.'),
        atividade);
        (Urgencia = 0 -> 
        writeln('Dificuldade: '),
        writeln('1 - Fácil | 2 - Médio | 3 - Difícil'),
        write('Adicione um desses níveis de dificuldade a sua atividade: '),
        ler_string(Dificuldade),
        write('Data de entrega: '),
        ler_string(Data),
        cadastrar_atividade(IdAtv, Tarefa, IdUsuario, Status, Urgencia, Dificuldade, Data),
        writeln('Atividade cadastrada com sucesso! \n'),
        main);
        (Urgencia = _ -> writeln('Opção inválida, por favor, escolha S ou N. \n')),
        atividade)).


cadastrar_atividade(Id, Nome, Usuario, Status, Urgencia, Dificuldade, Entrega) :-
    format(atom(Line), 'ID: ~w, NOME: ~w, USUÁRIO: ~w, STATUS: ~w, URGÊNCIA: ~w, DIFICULDADE: ~w, ENTREGA: ~w\n', [Id, Nome, Usuario, Status, Urgencia, Dificuldade, Entrega]),
    open('./dados/atividades.csv', append, Stream),
    write(Stream, Line),
    close(Stream).

% Refatorar em funções separadas e realizar verificações