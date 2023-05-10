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

editarAtividade :: IO ()
editarAtividade = do
  putStrLn "Qual é o identificador da atividade que você deseja editar?"
  idAtividade <- getLine
  putStrLn "O que você deseja alterar?"
  resposta <- getLine
  atividades <- lerAtividades "atividades.txt"
  let atividade = buscarAtividade (read idAtividade) atividades
  case resposta of
    "nome" -> do
      putStrLn "Digite o novo nome para a atividade:"
      novoNome <- getLine
      let atividadeAtualizada = alterarNomeAtividade novoNome atividade
      atualizarAtividade atividadeAtualizada atividades
      putStrLn "Nome da atividade atualizado com sucesso!"
    "status" -> do
      putStrLn "Digite o novo status para a atividade:"
      novoStatus <- getLine
      let atividadeAtualizada = alterarStatus novoStatus atividade
      atualizarAtividade atividadeAtualizada atividades
      putStrLn "Status da atividade atualizado com sucesso!"
    _ -> do
      putStrLn "Opção inválida. Tente novamente."
      editarAtividade
