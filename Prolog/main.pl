:- (initialization main).
:- include('atividade.pl').
:- include('editarAtividade.pl').
:- include('exibirQuadro.pl').
:- include('usuario.pl').
:- include('utils.pl').


main :-
    write('\n'),
    writeln('Boas vindas ao Kanban, um espaço para te auxiliar em suas atividades'),
    write('\n'),
    writeln('Escolha uma opção:'),
    write('\n'),
    writeln('!!!!!!!!!!!!! OBSERVAÇÃO !!!!!!!!!!!!!'),
    writeln('Não utilize acentos em suas respostas.'),
    write('\n'),
    writeln('1. Cadastrar usuário'),
    writeln('2. Cadastrar atividade'),
    writeln('3. Exibir quadro'),
    writeln('4. Editar uma atividade'),
    writeln('5. Alterar status de uma atividade'),
    writeln('6. Sair'),
    ler_numero(Opcao),
    escolherOpcao(Opcao).