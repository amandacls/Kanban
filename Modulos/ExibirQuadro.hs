module ExibirQuadro where

import qualified Atividade as Atividade

import System.IO

exibirQuadro :: IO ()
exibirQuadro = do
  putStrLn "+----------------+----------------+----------------+----------------+"
  putStrLn "|                        Quadro de Atividades                       |"
  putStrLn "+----------------+----------------+----------------+----------------+"
  putStrLn "| A fazer: "
  withFile "dados/atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesAFazer = filter (\linha -> (Atividade.status (read linha :: Atividade.Atividade)) == "A fazer") linhas
    mapM_ putStrLn atividadesAFazer)
  putStrLn "| Em andamento: "
  withFile "dados/atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesEmAndamento = filter (\linha -> (Atividade.status (read linha :: Atividade.Atividade)) == "Em andamento") linhas
    mapM_ putStrLn atividadesEmAndamento)
  putStrLn "| Concluídas: "
  withFile "dados/atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesConcluidas = filter (\linha -> (Atividade.status (read linha :: Atividade.Atividade)) == "Concluído") linhas
    mapM_ putStrLn atividadesConcluidas)
  putStrLn "| Atrasadas: "
  withFile "dados/atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesAtrasadas = filter (\linha -> (Atividade.status (read linha :: Atividade.Atividade)) == "Atrasado") linhas
    mapM_ putStrLn atividadesAtrasadas)
