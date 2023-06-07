cadastrar_usuario(Id, Nome, Funcao) :-
    format(atom(Line), 'ID: ~w, NOME: ~w, FUNÇÃO: ~w\n', [Id, Nome, Funcao]),
    open('dados/usuarios.txt', append, Stream),
    write(Stream, Line),
    close(Stream).