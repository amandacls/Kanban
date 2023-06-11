:- include('utils.pl').

editar_atividade :-
    writeln('Qual é o identificador da atividade que você deseja editar?'),
    ler_string(IdAtividade),
    ler_arquivo('atividades.csv', R),
    verifica_id(IdAtividade, R, R2),
    (R2 ->
    writeln('O que você deseja alterar?'),
    writeln('OBS: O que não quiser mudar, digite como estava.'),
    writeln('Digite as alterações:'),
    writeln('Novo nome: '),
    ler_string(NovoNome),
    writeln('Nova dificuldade: '),
    ler_string(NovaDificuldade),
    writeln('Nova urgência: '),
    ler_string(NovaUrgencia),
    writeln('Nova data de entrega: '),
    ler_string(NovaEntrega),
    seleciona(IdAtividade, R, X),
    remove(X, R, Nova),
    limpa_csv('atividades.csv'),
    edit_atividade(Nova),
    cadastrar_atividade(IdAtividade, NovoNome, _, _, NovaUrgencia, NovaDificuldade, NovaEntrega),
    writeln('Atividade atualizada com sucesso!'), main;
    writeln('Id não encontrado!'), editar_atividade).


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


edit_atividade([]).
edit_atividade([H|T]):-
    nth0(0, H, IdAtividade),
    nth0(1, H, Nome),
    nth0(2, H, IdUsuario),
    nth0(3, H, Status),
    nth0(4, H, Urgencia),
    nth0(5, H, Dificuldade),
    nth0(6, H, Data),
    cadastrar_atividade(IdAtividade, Nome, IdUsuario, Status, Urgencia, Dificuldade, Data),
    edit_atividade(T).
