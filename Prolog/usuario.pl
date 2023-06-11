:-use_module(library(csv)).

usuario :-
    write('Nome: '),
    ler_string(Nome),
    write('Função: '),
    ler_string(Funcao),
    write('Digite um id de até 6 números: '),
    ler_numero(IdUser),
    cadastrar_usuario(IdUser, Nome, Funcao), 
    write('Usuário cadastrado com sucesso!'),
    write('\n'),
    main.

cadastrar_usuario(Id, Nome, Funcao) :-
    format(atom(Line), 'ID: ~w, NOME: ~w, FUNÇÃO: ~w\n', [Id, Nome, Funcao]),
    open('./dados/usuarios.csv', append, Stream),
    write(Stream, Line),
    close(Stream).

% Verificar ID