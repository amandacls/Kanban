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

escolherOpcao(1) :- usuario, !.
escolherOpcao(2) :- atividade, !.
escolherOpcao(3) :- exibir_quadro, !.
escolherOpcao(4) :- editar_atividade, !.
escolherOpcao(5) :- editar_status, !.
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
    writeln('Status possiveis: 1 - A fazer | 2 - Em andamento | 3 - Concluído'),
    write('Adicione um desses status a sua atividade: '),
    ler_numero(Status),
    (\+ verifica_status(Status) -> writeln('Entrada inválida, por favor escolha uma das opções solicitadas.')
    ; write('Grau de urgência: '), 
      write('Você precisa de ajuda com o grau de urgência? (1 para sim, 2 para não) '), 
      ler_numero(Urgencia),
      (Urgencia = 1 -> 
        exibe_matriz,
        ler_numero(Entrada),
        (verifica_opcao(Entrada) -> writeln('Dificuldade: '),
        writeln('Fácil | Médio | Difícil'),
        write('Adicione um desses níveis de dificuldade a sua atividade: '),
        ler_string(Dificuldade),

        % Verificar dificuldade

        write('Data de entrega: '),
        ler_string(Data),
        cadastrar_atividade(IdAtv, Tarefa, IdUsuario, Status, Entrada, Dificuldade, Data),
        writeln('Atividade cadastrada com sucesso! \n');
        writeln('Entrada inválida, por favor escolha uma das opções solicitadas.'));
        (Urgencia = 2 -> 
        writeln('Dificuldade: '),
        writeln('Fácil | Médio | Difícil'),
        write('Adicione um desses níveis de dificuldade a sua atividade: '),
        ler_string(Dificuldade),
        write('Data de entrega: '),
        ler_string(Data),
        cadastrar_atividade(IdAtv, Tarefa, IdUsuario, Status, Urgencia, Dificuldade, Data),
        writeln('Atividade cadastrada com sucesso! \n'));
        (Urgencia -> writeln('Opção inválida, por favor, escolha S ou N. \n')))).

  % implementar o resto das funcoes
  % matriz Eisenhower
  

editar_atividade :-
    writeln('Qual é o identificador da atividade que você deseja editar?'),
    ler_string(IdAtividade),
    ler_arquivo('atividades.csv', R),
    verifica_id(IdAtividade, R, R2),
    (\+ R2 ->  writeln('Id não encontrado!'), editar_atividade ;
    writeln('O que você deseja alterar?'),
    writeln('OBS: O que não quiser mudar, digite como estava.'),
    writeln('Digite as alterações:'),
    writeln('Novo nome: '),
    ler_string(Nome),
    writeln('Nova dificuldade: '),
    ler_string(NovaDif),
    writeln('Nova urgência: '),
    ler_string(NovaUrg),
    writeln('Nova data de entrega: '),
    ler_string(NovaEntrega),
    edit_atividade('./dados/atividades.csv')),
    
    .
  % EditarAtividades.editarAtividade (read idAtividade) (Just novoNome) (Just novoDif) (Just novoUrg) (Just novoEntrega)
  % funcao de outro arquivo


/*
editar_status :-
    write('Digite o id da atividade que deseja alterar: '),
    ler_string(IdAtividade),
    write('Digite o novo status da atividade: '),
    ler_string(NovoStatus),
    main.
  % EditarAtividades.editarStatus (read idAtividade) (Just novoStatus)
  % funcao de outro arquivo 
*/