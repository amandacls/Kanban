import Data.Char ()
import Data.Set ()
import qualified Data.Text.IO as TIO
import Data.Time
import System.Directory ()
import System.IO ()
import System.Exit (exitSuccess)

import qualified Atividade as Atividade
import qualified EditarAtividades as EditarAtividades
import qualified ExibirQuadro as ExibirQuadro
import qualified Usuario as Usuario
import qualified Utils as Utils

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
  putStrLn "6. Sair"
  opcao <- getLine
  case opcao of 
    "1" -> usuario
    "2" -> atividade
    "3" -> ExibirQuadro.exibirQuadro
    "4" -> editarAtv
    "5" -> status
    "6" -> exitSuccess
    _ -> putStrLn "Opção inválida!"
  putStrLn "Digite uma das opções apresentadas:"
  main

usuario :: IO()
usuario = do
  putStr "Nome: "
  nome <- getLine
  putStr "Função: "
  funcao <- getLine
  putStr "Digite um id de até 6 números: "
  userId <- getLine
  let idUser = read userId :: Int
  usuarios <- Utils.exibirUser
  if Utils.verificaId idUser usuarios then do
    Utils.escreverUsuario (Usuario.cadastraUsuario idUser nome funcao)
    putStrLn "Usuário cadastrado com sucesso!"
  else do
    putStrLn "ID já cadastrado. Por favor, tente outro número."
    usuario

  --usuarios <- Utils.exibirUser
  --if (Utils.verificaId (read userId :: Int) usuarios) then do
  --  Utils.escreverUsuario(Usuario.cadastraUsuario (read(userId)) nome funcao)
  --  putStrLn "Usuário cadastrado com sucesso!"
  --else do
  --  putStrLn "ID Inválido, por favor tente outro número."
  --  usuario


atividade :: IO()
atividade = do
  putStr "Insira o ID da atividade: "
  idAtv <- getLine
  putStrLn "Tarefa:"
  putStr "Insira o nome: "
  tarefa <- getLine
  putStr "Usuário: "
  usuarioResp <- getLine
  putStrLn "Status:"
  putStrLn "Status possíveis: A fazer | Em andamento | Concluído"
  putStr "Adicione um desses status a sua atividade: "
  status <- getLine
  if (Utils.verificaStatus status == False) then do
      putStrLn "Entrada inválida, por favor escolha uma das opções solicitadas."
  else do
    putStrLn "Grau de urgência: "
    putStrLn "Você precisa de ajuda com o grau de urgência? S/N "
    urgencia <- getLine
    if urgencia == "S" then do
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
      putStrLn "2 - Importante e não urgente"
      putStrLn "3 - Não importante e urgente"
      putStrLn "4 - Não urgente e não importante"
      putStrLn "Opção: "
      opcao <- getLine
      if (Atividade.verificaOpcao opcao == False) then do
        putStrLn "Entrada inválida, por favor escolha uma das opções solicitadas."
        atividade
      else do
        putStrLn "Dificuldade: "
        putStrLn "Fácil | Médio | Difícil"
        putStr "Adicione um desses níveis de dificuldade a sua atividade: "
        dificuldade <- getLine
        putStr "Data de entrega: "
        entrega <- getLine
        Utils.escreverAtividade(Atividade.cadastrarAtividade (read(idAtv)) tarefa usuarioResp status opcao dificuldade entrega)
        putStrLn "Atividade cadastrada com sucesso!"
      else if urgencia == "N" then do
      putStrLn "Dificuldade: "
      putStrLn "Fácil | Médio | Difícil"
      putStr "Adicione um desses níveis de dificuldade a sua atividade: "
      dificuldade <- getLine
      putStr "Data de entrega: "
      entrega <- getLine
      Utils.escreverAtividade(Atividade.cadastrarAtividade (read(idAtv)) tarefa usuarioResp status urgencia dificuldade entrega)
      putStrLn "Atividade cadastrada com sucesso!"
    else do
      putStrLn "Opção inválida, por favor escolha S ou N."
      atividade

editarAtv :: IO ()
editarAtv = do
  putStrLn "Qual é o identificador da atividade que você deseja editar?"
  idAtividade <- getLine
  putStrLn "O que você deseja alterar?"
  putStrLn "OBS: O que não quiser mudar, digite com estava."
  putStrLn "Digite as alterações:"
  putStr "Novo nome: "
  novoNome <- getLine
  putStr "Nova dificuldade: "
  novoDif <- getLine
  putStr "Nova urgência: "
  novoUrg <- getLine
  putStr "Nova data de entrega: "
  novoEntrega <- getLine
  EditarAtividades.editarAtividade (read idAtividade) (Just novoNome) (Just novoDif) (Just novoUrg) (Just novoEntrega)
  --case resposta of
    --"nome" -> do
    --  putStrLn "Digite o novo nome para a atividade:"
    --  novoNome <- getLine
    --  EditarAtividades.editarAtividade (read idAtividade) (Just novoNome)
    --  putStrLn "Nome da atividade atualizado com sucesso!"
    --"dificuldade" -> do
    --  putStrLn "Digite a nova dificuldade para a atividade:"
    --  novaDif <- getLine
    --  EditarAtividades.editarAtividade (read idAtividade) Just (novaDif)
    --  putStrLn "Status da atividade atualizado com sucesso!"
    --"urgencia" -> do
    --  putStrLn "Digite a nova urgencia para a atividade:"
    --  novaUrg <- getLine
    --  EditarAtividades.editarAtividade (read idAtividade) (Just novaUrg)
    --"entrega" -> do
    --  putStrLn "Digite a nova data de entrega para a atividade:"
    --  novaEntrega <- getLine
    --  EditarAtividades.editarAtividade (read idAtividade) (Just novaEntrega)
    --"tudo" -> do
    --  putStrLn "OBS: O que não quiser mudar, digite com estava."
    --  putStrLn "Digite as alterações:"
    --  novoNome <- getLine
    --  novoDif <- getLine
    --  novoUrg <- getLine
    --  novoEntrega <- getLine
    --  EditarAtividades.editarAtividade (read idAtividade) (Just novoNome) (Just novoDif) (Just novoUrg) (Just novoEntrega)
    --_ -> do
    --  putStrLn "Opção inválida. Tente novamente."
    --  editarAtv

status :: IO()
status = do
  putStr "Digite o id da atividade que deseja alterar: "
  idAtividade <- getLine
  putStr "Digite o novo status da atividade: "
  novoStatus <- getLine
  EditarAtividades.editarStatus (read idAtividade) (Just novoStatus)