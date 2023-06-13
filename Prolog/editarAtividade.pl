:- use_module(library(csv)).
:- include('utils.pl').

editar_atividade :-
    writeln('Qual é o identificador da atividade que você deseja editar?'),
    ler_numero(IdAtividade),
    ler_arquivo('atividades.csv', R),
    verifica_id(IdAtividade, R, R2),
    (R2 = true ->
      writeln('O que você deseja alterar?'),
      writeln('OBS: O que não quiser mudar, digite como estava.'),
      writeln('Digite as alterações:'),
      write('Novo nome: '),
      ler_string(NovoNome),
      writeln('Entradas possíveis: '),
      writeln('1. Urgente e importante'),
      writeln('2. Importante e não urgente'),
      writeln('3. Não importante e urgente'),
      writeln('4. Não urgente e não importante'),
      write('Nova urgência: '),
      ler_numero(NovaUrgencia),
      (\+ verifica_opcao(NovaUrgencia) -> writeln('Entrada inválida, por favor escolha uma opção de dificuldade válida. \n'), editar_atividade;
      writeln('Entradas possíveis: Fácil | Médio | Difícil'),
      write('Nova dificuldade: '),
      ler_string(NovaDificuldade),
      (\+ verifica_dificuldade(NovaDificuldade) -> writeln('Entrada inválida, por favor, digite uma opção. \n'), editar_atividade;
      write('Nova data de entrega: '),
      ler_string(NovaEntrega),
      edita_lista(IdAtividade, NovoNome, NovaUrgencia, NovaDificuldade, NovaEntrega),
      writeln('Atividade atualizada com sucesso!'), main));
    writeln('Id não encontrado! \n'), editar_atividade).

editar_status :-
    write('Digite o id da atividade que deseja alterar: '),
    ler_numero(IdAtividade),
    ler_arquivo('atividades.csv', R),
    verifica_id(IdAtividade, R, R2),
    (R2 = true -> 
      writeln('Status possíveis: A fazer | Em andamento | Concluída'),
      write('Digite o novo status da atividade: '),
      ler_string(NovoStatus),
      (\+ verifica_status(NovoStatus) -> writeln('Entrada inválida, por favor escolha um status solicitado. \n'), editar_status;
      edita_status(IdAtividade, NovoStatus), 
      writeln('Status da atividade atualizado com sucesso!'), main);
    writeln('Id não encontrado! \n'), editar_status).
