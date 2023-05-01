import System.Directory ()
import System.IO ()
import Data.Char ()
import Data.Set ()

data Usuario = Usuario {nome::String, funcao::String} deriving ( Eq, Ord, Show, Read )
main :: IO()
main = do
  putStrLn "Boas vindas ao Kanban, um espaço para te auxiliar em suas atividades"
  putStrLn "Escolha uma opção:"
  putStrLn "1. Cadastrar usuário"
  putStrLn "2. Cadastrar atividade"
  putStrLn "3. Exibir quadro"
  putStrLn "4. Editar uma atividade"
  putStrLn "5. Alterar status de uma atividade"
  opcao <- getLine
  case opcao of "1" -> cadastrarUsuario
  case opcao of "2" -> cadastrarAtividade
  case opcao of "3" -> exibirQuadro
  case opcao of "4" -> editarAtividade
  case opcao of "5" -> alterarStatus

escrever :: FilePath -> Usuario -> IO ()
escrever arquivo usuario = do
  usuarios <- ler arquivo
  let listaUsuario = usuarios ++ [usuario]
  appendFile arquivo (unlines (map show listaUsuario))

ler :: FilePath -> IO [Usuario]
ler arquivo = do
  usuarios <- readFile arquivo
  let userStrings = lines usuarios
  return (map read userStrings)  

cadastrarUsuario::IO ()
cadastrarUsuario = do
    putStr "Nome: "
    name <- getLine
    putStr "Função: "
    func <- getLine
    let usuario = Usuario {nome = name, funcao = func}
    escrever "usuarios.txt" usuario

cadastrarAtividade :: IO()
cadastrarAtividade = do
    putStr "Tarefa: status + grau de urgência (4 níveis) + dificuldade + data de entrega"
    tarefa <- getLine
    putStr "Usuário: "
    usuarioResp <- getLine
    putStr "Status: "
    status <- getLine
    putStr "Grau de urgência: "
    putStrLn "Você precisa de ajuda com o grau de urgência? S/N"
    auxilio <- getLine
    case auxilio of "S" -> exibeAuxilio
    case auxilio of "N" -> continue
    putStr "Dificuldade: "
    dificuldade <- getLine
    putStr "Data de entrega: "
    entrega <- getLine
    let atividade = atividade {nome = tarefa, usuario = usuarioResp, status = status,
                              dificuldade = dificuldade, data = entrega}
    escrever "atividades.txt" atividade

exibeAuxilio :: IO()
exibeAuxilio = do
  putStrLn "Urgente e importante: Grau 1"
  putStrLn "Importante e não urgente: Grau 2"
  putStrLn "Não importante e urgente: Grau 3"
  putStrLn "Não urgente e não importante: Grau 4"
  grau <- getLine
  cadastrarAtividade <- auxilio -- aqui deve voltar para a recepção do cadastro de atividade


exibirQuadro :: IO()
exibirQuadro = do
  putStrLn data
  putStrLn "A fazer"
  putStrLn "Em andamento"
  putStrLn "Concluída"
  putStrLn "Atrasada"
-- criar arquivo para o quadro que chama as atividades

editarAtividade :: IO()
-- depende do arquivo de atividades

alterarStatus :: IO()
-- depende do arquivo de atividades