import Data.Char ()
import Data.Set ()
import qualified Data.Text.IO as TIO
import Data.Time
import System.Directory ()
import System.IO ()


verificaStatus :: String -> Bool
verificaStatus "A fazer" = True
verificaStatus "Em andamento" = True
verificaStatus "Concluido" = True
verificaStatus _ = False

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
      if urgencia == "S" then do
        exibeAuxilio
        cadastrarAtividade
        else if urgencia == "N" then do
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
      else do
        putStrLn "Opção inválida, por favor escolha S ou N."
        cadastrarAtividade


verificaOpcao :: String -> Bool
verificaOpcao opcao = opcao `elem` ["1", "2", "3", "4"]

exibeAuxilio :: IO Int
exibeAuxilio = do
  putStrLn "Matriz de Eisenhower:"
  putStrLn "+----------------+----------------+"
  putStrLn "| Urgente e      | Importante e   |"
  putStrLn "| importante     | não urgente    |"
  putStrLn "+----------------+----------------+"
  putStrLn "| Não urgente e  | Não importante |"
  putStrLn "| importante     | e urgente      |"
  putStrLn "+----------------+----------------+"
  putStrLn "Escolha o grau de urgência:"
  putStrLn "1 - Urgente e importante"
  putStrLn "2 - Importante e não urgent"
  putStrLn "3 - Não importante e urgente"
  putStrLn "4 - Não urgente e não importante"
  putStrLn "Opção: "
  opcao <- getLine
  if (verificaOpcao opcao == False) then do
      putStrLn "Entrada inválida, por favor escolha uma das opções solicitadas."
      exibeAuxilio
    else do
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