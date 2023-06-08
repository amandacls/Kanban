exibirQuadro:-
  write('+-------------------------------------------------------------------+'),
  write('|                        Quadro de Atividades                       |'),
  write('+-------------------------------------------------------------------+'),
  write('| A fazer: '),
    /* withFile "dados/atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesAFazer = filter (\linha -> (Atividade.status (read linha :: Atividade.Atividade)) == "A fazer") linhas
    mapM_ putStrLn atividadesAFazer) */
  write('| Em andamento: '),
  /* withFile "dados/atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesEmAndamento = filter (\linha -> (Atividade.status (read linha :: Atividade.Atividade)) == "Em andamento") linhas
    mapM_ putStrLn atividadesEmAndamento) */
  write('| Concluídas: '),
  /* withFile "dados/atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesConcluidas = filter (\linha -> (Atividade.status (read linha :: Atividade.Atividade)) == "Concluído") linhas
    mapM_ putStrLn atividadesConcluidas) */
  write('| Atrasadas: ').
  /* withFile "dados/atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesAtrasadas = filter (\linha -> (Atividade.status (read linha :: Atividade.Atividade)) == "Atrasado") linhas
    mapM_ putStrLn atividadesAtrasadas) */