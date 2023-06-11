:- include('utils.pl').

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
    writeln('Opção: '),
    ler_numero(Opcao),
    verifica_opcao(Opcao),
    add_dificuldade(IdAtv, Tarefa, IdUsuario, Status, Opcao).
% Falta funcionar na escrita do arquivo .csv

exibir_status :-
    writeln('Status:'),
    writeln('Status possiveis: A fazer | Em andamento | Concluído'),
    writeln('Adicione um desses status a sua atividade: ').
