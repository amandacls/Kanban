:-use_module(library(csv)).

usuario :-
    write('Nome: '),
    ler_string(Nome),
    write('Função: '),
    ler_string(Funcao),
    write('Digite um id de até 6 números: '),
    ler_numero(IdUser),
    ler_arquivo('usuarios.csv', R),
    verifica_id(IdUser, R, R2),
    (R2 = true -> writeln('ID já cadastrado!'), usuario;
    cadastrar_usuario(IdUser, Nome, Funcao), 
    write('Usuário cadastrado com sucesso!'),
    write('\n'),
    main).

cadastrar_usuario(Id, Nome, Funcao) :-
    atom_concat('./dados/', 'usuarios.csv', Path),
    csv_read_file(Path, File),
    append(File, [row(Id, Nome, Funcao)], NovaLista),
    csv_write_file(Path, NovaLista).