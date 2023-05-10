import Data.Char ()
import Data.Set ()
import qualified Data.Text.IO as TIO
import Data.Time
import System.Directory ()
import System.IO ()

import qualified Atividade as Atividade
import qualified EditarAtividades as EditarAtividades
import qualified ExibirQuadro as ExibirQuadro
import qualified Usuario as Usuario
import qualified Utils as Utils

main :: IO ()
main = do
  system "clear"
  putStrLn "Boas vindas ao Kanban, um espaço para te auxiliar em suas atividades"
  putStrLn "Observação: Não utilize acentos em suas respostas."
  putStrLn "Escolha uma opção:"
  putStrLn "1. Cadastrar usuário"
  putStrLn "2. Cadastrar atividade"
  putStrLn "3. Exibir quadro"
  putStrLn "4. Editar uma atividade"
  putStrLn "5. Alterar status de uma atividade"
  opcao <- getLine
  case opcao of 
    "1" -> usuario
    "2" -> atividade
    "3" -> ExibirQuadro.exibirQuadro
    "4" -> EditarAtividades.editarAtividade
    --"5" -> alterarStatus
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
  let iduser = read userId :: Int
  if (Utils.verificaId iduser == False) then do
    putStrLn "ID Inválido, por favor tente outro número."
    usuario
  else do
    Utils.escreverUsuario (Usuario.cadastraUsuario (read(userId)) nome funcao)
    --verifica a existencia de um usuario com o mesmo ID criar uma função genérica para isso
    --appendFile "usuarios.txt" usuarioStr
    --Utils.escreverUsuario usuario
    putStrLn "Usuário cadastrado com sucesso! Seu id de usuário é: " ++ show iduser


atividade :: IO()
atividade = do
  putStr "Insira o ID da atividade"
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
      cadastrarAtividade
  else do
    putStrLn "Grau de urgência: "
    putStr "Você precisa de ajuda com o grau de urgência? S/N"
    urgencia <- getLine
    if urgencia == "S" then do
      exibeAuxilio
      atividade
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