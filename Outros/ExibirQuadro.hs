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

import System.IO

exibirQuadro :: IO ()
exibirQuadro = do
  putStrLn "Quadro de Atividades"
  putStrLn ""
  putStrLn "A fazer: "
  withFile "atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesAFazer = filter (\linha -> (status (read linha :: Atividade)) == "A fazer") linhas
    mapM_ putStrLn atividadesAFazer)
  putStrLn "Em andamento: "
  withFile "atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesEmAndamento = filter (\linha -> (status (read linha :: Atividade)) == "Em andamento") linhas
    mapM_ putStrLn atividadesEmAndamento)
  putStrLn "Concluídas: "
  withFile "atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesConcluidas = filter (\linha -> (status (read linha :: Atividade)) == "Concluído") linhas
    mapM_ putStrLn atividadesConcluidas)
  putStrLn "Atrasadas: "
  withFile "atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesAtrasadas = filter (\linha -> (status (read linha :: Atividade)) == "Atrasado") linhas
    mapM_ putStrLn atividadesAtrasadas)
