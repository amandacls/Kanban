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
escolherOpcao(3) :- exibirQuadro.
escolherOpcao(4) :- editarAtividade.
escolherOpcao(5) :- status.
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

/*
atividade :-
    write('Insira o ID da atividade'),
    ler_string(IdAtv),
    writeln('Tarefa:' ),
    write('Insira o nome: '),
    ler_string(Tarefa),
    write('Usuario: '),
    ler_string(IdUsuario),
    writeln('Status:'),
    writeln('Status possiveis: A fazer | Em andamento | Concluído'),
    write('Adicione um desses status a sua atividade'),
    ler_string(status),

    main.
  % implementar o resto das funcoes
  % matriz Eisenhower
  

editarAtividade :-
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

status :-
    write('Digite o id da atividade que deseja alterar: '),
    ler_string(IdAtividade),
    write('Digite o novo status da atividade: '),
    ler_string(NovoStatus),
    main.
  % EditarAtividades.editarStatus (read idAtividade) (Just novoStatus)
  % funcao de outro arquivo 

*/