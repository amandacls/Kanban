import Data.Char ()
import Data.Set ()
-- import qualified Data.Text.IO as TIO
import Data.Time
import System.Directory ()
import System.IO ()

--import System.Random

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

  if (verificaEntrada opcao)
    then
      if (opcao == "1")
        then cadastrarUsuario
        else
          if (opcao == "2")
            then cadastrarAtividade
            else -- else if (opcao == "3") then exibirQuadro
            -- else if (opcao == "4") then -> editarAtividade
            -- else if (opcao == "5") then -> alterarStatus
              putStrLn ""
    else do
      putStrLn "Opção inválida."
      putStrLn "Digite uma das opções apresentadas:"
      main

verificaEntrada :: String -> Bool
verificaEntrada "0" = True
verificaEntrada "1" = True
verificaEntrada "2" = True
verificaEntrada "3" = True
verificaEntrada "4" = True
verificaEntrada "5" = True
verificaEntrada _ = False

verificaStatus :: String -> Bool
verificaStatus "A fazer" = True
verificaStatus "Em andamento" = True
verificaStatus "Concluido" = True
verificaStatus _ = False

verificaId :: Int -> Bool
verificaId userId = length (show userId) <= 6

-- escreverUsuario :: Usuario -> IO ()
-- escreverUsuario usuario = do
--  meu_arquivo <- openFile "usuarios.txt" WriteMode
--  let user = show usuario
--  hPutStr meu_arquivo user
--  hFlush meu_arquivo

-- escreverAtividade :: Atividade -> IO ()
-- escreverAtividade atividade = do
--  meu_arquivo <- openFile "atividades.txt" WriteMode
-- let atv = show atividade
--  hPutStr meu_arquivo atv
--  hFlush meu_arquivo

-- exibir :: IO ()
-- exibir = do
--  meu_arquivo <- openFile "atividades.txt" ReadMode
--  conteudo <- hGetContents meu_arquivo
--  print conteudo

cadastrarUsuario :: IO ()
cadastrarUsuario = do
  putStr "Nome:"
  nome <- getLine
  putStr "Função:"
  funcao <- getLine
  putStr "Digite um id de até 6 números: "
  userId <- getLine
  let iduser = read userId :: Int
  if (verificaId iduser == False) then do
    putStrLn "ID Inválido, por favor tente outro número."
    cadastrarUsuario
  else do
    let usuario = Usuario {idUsuario = iduser, nome = nome, funcao = funcao}
        usuarioStr = show usuario ++ "\n"
  -- verifica a existencia de um usuario com o mesmo ID criar uma função genérica para isso
    appendFile "usuarios.txt" usuarioStr
  -- putStrLn "Seu id de usuário é: " ++ idUsuario
    putStrLn "Usuário cadastrado com sucesso!"

-- gerarId :: IO ()

cadastrarAtividade :: IO ()
cadastrarAtividade = do
  putStrLn "Tarefa:"
  putStr "Insira o nome: "
  tarefa <- getLine
  putStr "Usuário: "
  usuarioResp <- getLine
  putStrLn "Status:"
  putStrLn "Status possíveis: A fazer | Em andamento | Concluído"
  putStr "Adicione um desses status a sua atividade: "
  status <- getLine
  if (verificaStatus status == False) then do
      putStrLn "Entrada inválida, por favor escolha uma das opções solicitadas."
      cadastrarAtividade
    else do
      putStrLn "Grau de urgência: "
      putStr "Você precisa de ajuda com o grau de urgência? S/N"
      urgencia <- getLine
      --if (urgencia == "S") then exibeAuxilio
      putStrLn "Dificuldade: "
      putStrLn "Fácil | Médio | Difícil"
      putStr "Adicione um desses níveis de dificuldade a sua atividade: "
      dificuldade <- getLine
      putStr "Data de entrega: "
      entrega <- getLine
      let atividade = Atividade {nomeAtividade = tarefa, usuario = usuarioResp, status = status, dificuldade = dificuldade, entrega = entrega}
          atividadeStr = show atividade ++ "\n"
      appendFile "atividades.txt" atividadeStr
      putStrLn "Atividade cadastrada com sucesso!"

-- funcaoAuxilio ::IO ()
-- funcaoAuxilio =

-- exibeAuxilio :: IO ()
-- exibeAuxilio = do
--  putStrLn "Urgente e importante: Grau 1"
--  putStrLn "Importante e não urgente: Grau 2"
--  putStrLn "Não importante e urgente: Grau 3"
--  putStrLn "Não urgente e não importante: Grau 4"
--  urgencia <- getLine
--  atividade = Atividade {urgencia = urgencia}
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
