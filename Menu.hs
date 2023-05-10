import Data.Char ()
import Data.Set ()
import qualified Data.Text.IO as TIO
import Data.Time
import System.Directory ()
import System.IO ()

data Usuario = Usuario {idUsuario :: Int, nome :: String, funcao :: String} deriving (Show, Read)

data Atividade = Atividade {idAtividade :: Int, nomeAtividade :: String, usuario :: String, status :: String, urgencia :: String, dificuldade :: String, entrega :: String} deriving (Show, Read)

main :: IO ()
main = do
  putStrLn "Boas vindas ao Kanban, um espaço para te auxiliar em suas atividades"
  putStrLn "Observação: Não utilize acentos em suas respostas."
  putStrLn "Escolha uma opção:"
  putStrLn "1. Cadastrar usuário"
  putStrLn "2. Cadastrar atividade"
  putStrLn "3. Exibir quadro"
  putStrLn "4. Editar uma atividade"
  putStrLn "5. Alterar status de uma atividade"
  opcao <- getLine
  case opcao of 
    "1" -> cadastrarUsuario
    "2" -> cadastrarAtividade
    "3" -> exibirQuadro
    "4" -> editarAtividade
    "5" -> alterarStatus
    _ -> putStrLn "Opção inválida!"
  putStrLn "Digite uma das opções apresentadas:"
  main

lerArquivoUsuarios :: IO [Usuario]
lerArquivoUsuarios = do
  conteudo <- readFile "usuarios.txt"
  return $ map read (lines conteudo)

escreverUsuario :: Usuario -> IO ()
escreverUsuario usuario = do
  meu_arquivo <- openFile "usuarios.txt" WriteMode
  let user = show usuario
  hPutStr meu_arquivo user
  hFlush meu_arquivo

escreverAtividade :: Atividade -> IO ()
escreverAtividade atividade = do
  meu_arquivo <- openFile "atividades.txt" WriteMode
  let atv = show atividade
  hPutStr meu_arquivo atv
  hFlush meu_arquivo

exibir :: IO ()
exibir = do
  meu_arquivo <- openFile "atividades.txt" ReadMode
  conteudo <- hGetContents meu_arquivo
  print conteudo
