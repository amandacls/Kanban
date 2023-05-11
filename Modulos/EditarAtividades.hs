module EditarAtividades where

import Data.List (find)
import Data.Maybe (fromMaybe)
import System.IO

import qualified Atividade as Atividade
import qualified Utils as Utils

-- editarAtividade :: IO()
-- editarAtividade = do
-- putStrLn "O que você deseja alterar?"
-- resposta <- getLine
-- if resposta == "nome" then alterarNomeAtividade
-- else if resposta == ""
-- depende do arquivo de atividades

--alterarStatus :: String -> Atividade.Atividade -> Atividade.Atividade
--alterarStatus novoStatus atividade = atividade {Atividade.status = novoStatus}

--alterarNomeAtividade :: String -> Atividade.Atividade -> Atividade.Atividade
--alterarNomeAtividade novoNome atividade = atividade {Atividade.nomeAtividade = novoNome}


-- putStrLn "Altere o status de uma atividade!"
-- putStrLn "Insira o identificador da atividade: "
-- novoStatus <- getLine

--alterarDificuldade :: String -> Atividade.Atividade -> Atividade.Atividade
--alterarDificuldade novaDif atividade = atividade {Atividade.dificuldade = novaDif}

--buscarAtividade :: Int -> [Atividade.Atividade] -> Maybe Atividade.Atividade
--buscarAtividade idAtv atividades =
--  let atividadeEncontrada = filter (\atividade -> Atividade.idAtividade atividade == idAtv) atividades
--  in case atividadeEncontrada of
--    [atividade] -> Just atividade
--    _ -> Nothing 

--verificaIdAtv :: Int -> IO Bool
--verificaIdAtv atvId = do
--  atividades <- Utils.exibir
--  return $ not $ any (\atividade -> Atividade.idAtividade atividade == atvId) atividades


--editarAtividade :: IO ()
--editarAtividade = do
--  putStrLn "Qual é o identificador da atividade que você deseja editar?"
--  idAtividade <- getLine
--  putStrLn "O que você deseja alterar?"
--  resposta <- getLine
--  atividades <- Utils.exibir
--  let atividade = buscarAtividade (read idAtividade) atividades
--  case resposta of
--    "nome" -> do
--      putStrLn "Digite o novo nome para a atividade:"
--      novoNome <- getLine
--      alterarNomeAtividade novoNome atividade
--      putStrLn "Nome da atividade atualizado com sucesso!"
--    "dificuldade" -> do
--      putStrLn "Digite a nova dificuldade para a atividade:"
--      novaDif <- getLine
--      alterarDificuldade novaDif atividade
--      putStrLn "Status da atividade atualizado com sucesso!"
--    _ -> do
--      putStrLn "Opção inválida. Tente novamente."
--      editarAtividade

editarAtividade :: Int -> Maybe String -> Maybe String -> Maybe String -> Maybe String -> IO ()
editarAtividade idAtividade novoNome mNovaDificuldade mNovaUrgencia mNovaEntrega = do
    -- Leitura do arquivo de atividades
    withFile "atividades.txt" ReadWriteMode $ \handle -> do
        -- Leitura do conteúdo do arquivo
        arquivo <- hGetContents handle
        let atividades = read arquivo :: [Atividade.Atividade]

    -- Criação da nova atividade com os valores atualizados
        let atividadeAtualizada = case find (\a -> idAtividade == Atividade.idAtividade a) atividades of
                                    Just atividade -> atividade { Atividade.nomeAtividade = fromMaybe (Atividade.nomeAtividade atividade) novoNome
                                                              , Atividade.dificuldade = fromMaybe (Atividade.dificuldade atividade) mNovaDificuldade
                                                              , Atividade.urgencia = fromMaybe (Atividade.urgencia atividade) mNovaUrgencia
                                                              , Atividade.entrega = fromMaybe (Atividade.entrega atividade) mNovaEntrega }
                                    Nothing -> error "Atividade não encontrada"

    -- Atualização da lista de atividades com a nova atividade
        let atividadesAtualizadas = map (\a -> if idAtividade == Atividade.idAtividade a then atividadeAtualizada else a) atividades

    -- Escrita das atividades atualizadas no arquivo
        hSeek handle AbsoluteSeek 0
        hPutStr handle (unlines (map show atividadesAtualizadas))
        hFlush handle

editarStatus :: Int -> Maybe String -> IO ()
editarStatus idAtividade mNovoStatus = do
    -- Leitura do arquivo de atividades
    withFile "atividades.txt" ReadWriteMode $ \handle -> do
        -- Leitura do conteúdo do arquivo
        arquivo <- hGetContents handle
        let atividades = read arquivo :: [Atividade.Atividade]

        -- Criação da nova atividade com o status atualizado
        let atividadeAtualizada = case find (\a -> idAtividade == Atividade.idAtividade a) atividades of
                                    Just atividade -> atividade { Atividade.status = fromMaybe (Atividade.status atividade) mNovoStatus }
                                    Nothing -> error "Atividade não encontrada"

        -- Atualização da lista de atividades com a nova atividade
        let atividadesAtualizadas = map (\a -> if idAtividade == Atividade.idAtividade a then atividadeAtualizada else a) atividades

        -- Escrita das atividades atualizadas no arquivo
        hSeek handle AbsoluteSeek 0
        hPutStr handle (unlines (map show atividadesAtualizadas))
        hFlush handle
