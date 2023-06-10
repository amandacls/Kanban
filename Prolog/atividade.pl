cadastrar_atividade(Id, Nome, Usuario, Status, Urgencia, Dificuldade, Entrega) :-
    format(atom(Line), 'ID: ~w, NOME: ~w, USUÁRIO: ~w, STATUS: ~w, URGÊNCIA: ~w, DIFICULDADE: ~w, ENTREGA: ~w\n', [Id, Nome, Usuario, Status, Urgencia, Dificuldade, Entrega]),
    open('./dados/atividades.csv', append, Stream),
    write(Stream, Line),
    close(Stream).