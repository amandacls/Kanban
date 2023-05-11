module EditarAtividades where

import qualified Atividade as Atividade
import qualified Utils as Utils

-- editarAtividade :: IO()
-- editarAtividade = do
-- putStrLn "O que você deseja alterar?"
-- resposta <- getLine
-- if resposta == "nome" then alterarNomeAtividade
-- else if resposta == ""
-- depende do arquivo de atividades

--alterarStatus :: String -> Atividade -> Atividade
--alterarStatus novoStatus atividade = atividade {status = novoStatus}

alterarNomeAtividade :: String -> Atividade.Atividade -> Atividade.Atividade
alterarNomeAtividade novoNome atividade = atividade {Atividade.nomeAtividade = novoNome}


-- putStrLn "Altere o status de uma atividade!"
-- putStrLn "Insira o identificador da atividade: "
-- novoStatus <- getLine

alterarDificuldade :: String -> Atividade.Atividade -> Atividade.Atividade
alterarDificuldade novaDif atividade = atividade {Atividade.dificuldade = novaDif}

buscarAtividade :: Int -> [Atividade.Atividade] -> Maybe Atividade.Atividade
buscarAtividade idAtv atividades =
  let atividadeEncontrada = filter (\atividade -> Atividade.idAtividade atividade == idAtv) atividades
  in case atividadeEncontrada of
    [atividade] -> Just atividade
    _ -> Nothing 

--verificaIdAtv :: Int -> IO Bool
--verificaIdAtv atvId = do
--  atividades <- Utils.exibir
--  return $ not $ any (\atividade -> Atividade.idAtividade atividade == atvId) atividades


editarAtividade :: IO ()
editarAtividade = do
  putStrLn "Qual é o identificador da atividade que você deseja editar?"
  idAtividade <- getLine
  putStrLn "O que você deseja alterar?"
  resposta <- getLine
  atividades <- Utils.exibir
  let atividade = buscarAtividade (read idAtividade) atividades
  case resposta of
    "nome" -> do
      putStrLn "Digite o novo nome para a atividade:"
      novoNome <- getLine
      alterarNomeAtividade novoNome atividade
      putStrLn "Nome da atividade atualizado com sucesso!"
    "dificuldade" -> do
      putStrLn "Digite a nova dificuldade para a atividade:"
      novaDif <- getLine
      alterarDificuldade novaDif atividade
      putStrLn "Status da atividade atualizado com sucesso!"
    _ -> do
      putStrLn "Opção inválida. Tente novamente."
      editarAtividade
