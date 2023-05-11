module EditarAtividades where

import Data.List (find)
import Data.Maybe (fromMaybe)
import System.IO

import qualified Atividade as Atividade
import qualified Utils as Utils


editarAtividade :: Int -> Maybe String -> Maybe String -> Maybe String -> Maybe String -> IO ()
editarAtividade idAtividade novoNome mNovaDificuldade mNovaUrgencia mNovaEntrega = do
    withFile "dados/atividades.txt" ReadWriteMode $ \handle -> do
        arquivo <- hGetContents handle
        let atividades = read arquivo :: [Atividade.Atividade]

        let atividadeAtualizada = case find (\a -> idAtividade == Atividade.idAtividade a) atividades of
                                    Just atividade -> atividade { Atividade.nomeAtividade = fromMaybe (Atividade.nomeAtividade atividade) novoNome
                                                              , Atividade.dificuldade = fromMaybe (Atividade.dificuldade atividade) mNovaDificuldade
                                                              , Atividade.urgencia = fromMaybe (Atividade.urgencia atividade) mNovaUrgencia
                                                              , Atividade.entrega = fromMaybe (Atividade.entrega atividade) mNovaEntrega }
                                    Nothing -> error "Atividade não encontrada"

        let atividadesAtualizadas = map (\a -> if idAtividade == Atividade.idAtividade a then atividadeAtualizada else a) atividades

        hSeek handle AbsoluteSeek 0
        hPutStr handle (unlines (map show atividadesAtualizadas))
        hFlush handle

editarStatus :: Int -> Maybe String -> IO ()
editarStatus idAtividade mNovoStatus = do
    withFile "dados/atividades.txt" ReadWriteMode $ \handle -> do
        arquivo <- hGetContents handle
        let atividades = read arquivo :: [Atividade.Atividade]

        let atividadeAtualizada = case find (\a -> idAtividade == Atividade.idAtividade a) atividades of
                                    Just atividade -> atividade { Atividade.status = fromMaybe (Atividade.status atividade) mNovoStatus }
                                    Nothing -> error "Atividade não encontrada"

        let atividadesAtualizadas = map (\a -> if idAtividade == Atividade.idAtividade a then atividadeAtualizada else a) atividades

        hSeek handle AbsoluteSeek 0
        hPutStr handle (unlines (map show atividadesAtualizadas))
        hFlush handle
