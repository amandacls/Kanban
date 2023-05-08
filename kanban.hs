import Data.Char ()
import Data.Set ()
import qualified Data.Text.IO as TIO
import Data.Time
import System.Directory ()
import System.IO ()

-- import System.Random

data Usuario = Usuario {idUsuario :: Int, nome :: String, funcao :: String} deriving (Show, Read)

data Atividade = Atividade {idAtividade :: Int, nomeAtividade :: String, usuario :: Int, status :: String, urgencia :: String, dificuldade :: String, entrega :: String} deriving (Show, Read)

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
  case opcao of "1" -> cadastrarUsuario
  case opcao of "2" -> cadastrarAtividade

-- case opcao of "3" -> exibirQuadro
-- case opcao of "4" -> editarAtividade
-- case opcao of "5" -> alterarStatus

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

toStringAtividade :: Atividade -> String
toStringAtividade atividade = show atividade

exibir :: IO ()
exibir = do
  meu_arquivo <- openFile "atividades.txt" ReadMode
  conteudo <- hGetContents meu_arquivo
  print conteudo

cadastrarUsuario :: IO ()
cadastrarUsuario = do
  putStrLn "Nome:"
  nome <- getLine
  putStrLn "Função:"
  funcao <- getLine
  userid <- newStdGen
  -- let (idUsuario, _) = randomR (1, 1000000) gen :: (Int, StdGen)
  let usuario = Usuario {idUsuario = idUsuario, nome = nome, funcao = funcao}
      usuarioStr = show usuario ++ "\n"
  -- verifica a existencia de um usuario com o mesmo ID criar uma função genérica para isso
  appendFile "usuarios.txt" usuarioStr
  putStrLn "Seu id de usuário é: " ++ idUsuario
  putStrLn "Usuário cadastrado com sucesso!"

-- gerarId :: IO ()

cadastrarAtividade :: IO ()
cadastrarAtividade = do
  putStrLn "Tarefa:"
  putStr "Insira o nome: "
  tarefa <- getLine
  putStrLn "Usuário: "
  usuarioResp <- getLine
  putStrLn "Status:"
  putStrLn "Status possíveis: A fazer | Em andamento | Concluído"
  putStrLn "Adicione um desses status a sua atividade: "
  status <- getLine
  putStrLn "Grau de urgência: "

  putStrLn "Você precisa de ajuda com o grau de urgência? S/N"
  auxilio <- getLine
  -- funcaoAuxilio
  putStrLn "Dificuldade: "
  putStrLn "Fácil | Médio | Difícil"
  putStrLn "Adicione um desses níveis de dificuldade a sua atividade: "
  dificuldade <- getLine
  putStr "Data de entrega: "
  entrega <- getLine
  let atividade = Atividade {nomeAtividade = tarefa, usuario = usuarioResp, status = status, urgencia = "", dificuldade = dificuldade, entrega = entrega}
      atividadeStr = show atividade ++ "\n"
  appendFile "atividades.txt" atividadeStr
  putStrLn "Atividade cadastrada com sucesso!"

-- funcaoAuxilio ::IO ()
-- funcaoAuxilio = do
-- if auxilio == "S" then exibeAuxilio
-- else if auxilio == "N" then atividade = Atividade {urgencia = ""}
-- else putStr "Opção inválida."

-- exibeAuxilio :: IO ()
-- exibeAuxilio = do
-- putStrLn "Urgente e importante: Grau 1"
-- putStrLn "Importante e não urgente: Grau 2"
-- putStrLn "Não importante e urgente: Grau 3"
-- putStrLn "Não urgente e não importante: Grau 4"
-- urgencia <- getLine
-- atividade = Atividade {urgencia = urgencia}
-- cadastrarAtividade <- cadastrarAtividade.auxilio -- aqui deve voltar para a recepção do cadastro de atividade

-- exibirQuadro :: IO ()
-- exibirQuadro = do
-- putStrLn "data"
-- putStrLn "A fazer"
-- readFile atividades.txt -> Atividade {status = "A fazer"}
-- putStrLn "Em andamento"
-- readFile atividades.txt -> Atividade {status = "Em andamento"}
-- putStrLn "Concluída"
-- readFile atividades.txt -> Atividade {status = "A fazer"}
-- putStrLn "Atrasada"

-- criar arquivo para o quadro que chama as atividades

-- editarAtividade :: IO()
-- editarAtividade = do
-- putStrLn "O que você deseja alterar?"
-- resposta <- getLine
-- if resposta == "nome" then alterarNomeAtividade
-- else if resposta == ""
-- depende do arquivo de atividades

-- alterarStatus :: String -> Atividade -> Atividade
-- alterarStatus novoStatus atividade = atividade {status = novoStatus}

-- aterarNomeAtividade :: String -> Atividade -> Atividade
-- alterarNomeAtividade novoNome atividade = atividade {nomeAtividade = novoNome}

-- putStrLn "Altere o status de uma atividade!"
-- putStrLn "Insira o identificador da atividade: "
-- novoStatus <- getLine
