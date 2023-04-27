import System.Directory ()
import System.IO ()
import Data.Char ()

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
  
cadastrarUsuario::IO ()
cadastrarUsuario = do
    putStr "Nome: "
    name <- getLine
    putStr "Função: "
    func <- getLine
    let usuario = Usuario {nome = name, funcao = func}
    escrever "usuarios.txt" usuario


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

cadastrarAtividade :: IO()
-- criar arquivo para atividades

exibirQuadro :: IO()
-- criar arquivo para o quadro que chama as atividades

editarAtividade :: IO()
-- depende do arquivo de atividades

alterarStatus :: IO()
-- depende do arquivo de atividades