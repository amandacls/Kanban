exibir_quadro:-
  writeln('+-------------------------------------------------------------------+'),
  writeln('|                        Quadro de Atividades                       |'),
  writeln('+-------------------------------------------------------------------+'),
  writeln('| A fazer: '),
    /* withFile "dados/atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesAFazer = filter (\linha -> (Atividade.status (read linha :: Atividade.Atividade)) == "A fazer") linhas
    mapM_ putStrLn atividadesAFazer) */
  writeln('| Em andamento: '),
  /* withFile "dados/atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesEmAndamento = filter (\linha -> (Atividade.status (read linha :: Atividade.Atividade)) == "Em andamento") linhas
    mapM_ putStrLn atividadesEmAndamento) */
  writeln('| Concluídas: ').
  /* withFile "dados/atividades.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    let linhas = lines contents
        atividadesConcluidas = filter (\linha -> (Atividade.status (read linha :: Atividade.Atividade)) == "Concluído") linhas
    mapM_ putStrLn atividadesConcluidas) */