:- include('usuario.pl').
:- include('atividade.pl').
:- include('editarAtividade.pl').
:- include('exibirQuadro.pl').
:- include('utils.pl').

main :-
    write('\n'),
    writeln('Boas vindas ao Kanban, um espaço para te auxiliar em suas atividades'),
    write('\n'),
    writeln('Escolha uma opção:'),
    writeln('1. Cadastrar usuário'),
    writeln('2. Cadastrar atividade'),
    writeln('3. Exibir quadro'),
    writeln('4. Editar uma atividade'),
    writeln('5. Alterar status de uma atividade'),
    writeln('6. Sair'),
    ler_numero(Opcao),
    escolherOpcao(Opcao).

escolherOpcao(1) :- usuario.
escolherOpcao(2) :- atividade.
escolherOpcao(3) :- exibir_quadro.
escolherOpcao(4) :- editar_atividade.
escolherOpcao(5) :- editar_status.
escolherOpcao(6) :- halt.
escolherOpcao(_) :- writeln('Opção inválida!'), main.


usuario :-
    write('Nome: '),
    ler_string(Nome),
    write('Função: '),
    ler_string(Funcao),
    write('Digite um id de até 6 números: '),
    ler_string(IdUser),
    cadastrar_usuario(IdUser, Nome, Funcao), 
    write('Usuário cadastrado com sucesso!'),
    write('\n'),
    main.


atividade :-
    write('Insira o ID da atividade: '),
    ler_string(IdAtv),
    writeln('Tarefa:' ),
    write('Insira o nome: '),
    ler_string(Tarefa),
    write('Usuario: '),
    ler_string(IdUsuario),
    writeln('Status:'),
    writeln('Status possiveis: A fazer | Em andamento | Concluído'),
    write('Adicione um desses status a sua atividade: '),
    ler_numero(Status),
    (\+ verifica_status(Status) -> writeln('Entrada inválida, por favor escolha uma das opções solicitadas.')
    ; write('Grau de urgência: '), 
      write('Você precisa de ajuda com o grau de urgência? S/N '), 
      ler_string(Urgencia),
      (Urgencia = 'S' -> 
        writeln('Matriz de Eisenhower:'),
        writeln('+----------------+----------------+'),
        writeln('| Urgente e      | Importante e   |'),
        writeln('| importante     | não urgente    |'),
        writeln('+----------------+----------------+'),
        writeln('| Não urgente e  | Não importante |'),
        writeln('| importante     | e urgente      |'),
        writeln('+----------------+----------------+'),
        writeLn('Escolha o grau de urgência:'),
        writeLn('1 - Urgente e importante'),
        writeLn('2 - Importante e não urgente'),
        writeLn('3 - Não importante e urgente'),
        writeLn('4 - Não urgente e não importante'),
        writeLn('Opção: '),
        ler_string(Opcao)),

        % Verificar opcao

        writeln('Dificuldade: '),
        writeln('Fácil | Médio | Difícil'),
        write('Adicione um desses níveis de dificuldade a sua atividade: '),
        ler_string(Dificuldade),

        % Verificar dificuldade

        write('Data de entrega: '),
        ler_string(Data),
        cadastrar_atividade(IdAtv, Tarefa, IdUsuario, Status, Urgencia, Dificuldade, Data),
        writeln('Atividade cadastrada com sucesso! \n');
      (Urgencia = 'N'-> 
        writeln('Dificuldade: '),
        writeln('Fácil | Médio | Difícil'),
        write('Adicione um desses níveis de dificuldade a sua atividade: '),
        ler_string(Dificuldade),
        write('Data de entrega: '),
        ler_string(Data),
        cadastrar_atividade(IdAtv, Tarefa, IdUsuario, Status, Urgencia, Dificuldade, Data),
        writeln('Atividade cadastrada com sucesso! \n'));
      (Urgencia = _ -> writeln('Opção inválida, por favor, escolha S ou N. \n'))),
    main.

  % implementar o resto das funcoes
  % matriz Eisenhower
  

/*
editar_atividade :-
    write('Qual é o identificador da atividade que você deseja editar?'),
    ler_string(IdAtividade),
    write('O que você deseja alterar?'),
    write('OBS: O que não quiser mudar, digite como estava.'),
    write('Digite as alterações:'),
    write('Novo nome: '),
    ler_string(Nome),
    write('Nova dificuldade: '),
    ler_string(NovaDif),
    write('Nova urgência: '),
    ler_string(NovaUrg),
    write('Nova data de entrega: '),
    ler_string(NovaEntrega),
    main.
  % EditarAtividades.editarAtividade (read idAtividade) (Just novoNome) (Just novoDif) (Just novoUrg) (Just novoEntrega)
  % funcao de outro arquivo

editar_status :-
    write('Digite o id da atividade que deseja alterar: '),
    ler_string(IdAtividade),
    write('Digite o novo status da atividade: '),
    ler_string(NovoStatus),
    main.
  % EditarAtividades.editarStatus (read idAtividade) (Just novoStatus)
  % funcao de outro arquivo 

exibir_quadro:-
*/