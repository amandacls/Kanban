module Utils where

import Data.Time (parseTimeM, defaultTimeLocale)
import Data.Map as Map (fromList, Map)
import Data.List
import System.IO.Unsafe (unsafePerformIO)

import qualified Atividade as Atividade
import qualified Usuario as Usuario


exibirUser :: IO ([Usuario.Usuario])
exibirUser = do
  meu_arquivo <- readFile "usuarios.txt"
  let lista = ((Data.List.map words (lines meu_arquivo)))
  let lista_user = (Data.List.map constroiUser lista)
  return lista_user

constroiUser :: [String] -> Usuario.Usuario
constroiUser [strIdUser, nomeUser, funcao] =
  let idUser = read strIdUser
      nome = nomeUser
      funcao = funcao
   in Usuario.Usuario { Usuario.idUsuario = idUser
                          , Usuario.nome = nomeUser
                          , Usuario.funcao = funcao}
constroiUser _ = error "Lista deve ter três elementos"

exibir :: IO ([Atividade.Atividade])
exibir = do
  meu_arquivo <- readFile "atividades.txt"
  let lista = ((Data.List.map words (lines meu_arquivo)))
  let lista_atividade = (Data.List.map constroiAtividade lista)
  return lista_atividade

constroiAtividade :: [String] -> Atividade.Atividade
constroiAtividade [strIdAtividade, nomeAtividade, status, strUrgencia, strDificuldade, strEntrega] =
  let idAtividade = read strIdAtividade
      urgencia = read strUrgencia
      dificuldade = read strDificuldade
      entrega = read strEntrega
   in Atividade.Atividade { Atividade.idAtividade = idAtividade
                          , Atividade.nomeAtividade = nomeAtividade
                          , Atividade.status = status
                          , Atividade.urgencia = urgencia
                          , Atividade.dificuldade = dificuldade
                          , Atividade.entrega = entrega
                          }
constroiAtividade _ = error "Lista deve ter seis elementos"

escreverUsuario :: Usuario.Usuario -> IO()
escreverUsuario user = do
  let userStr = "ID: " ++ show(Usuario.idUsuario user) ++ ", NOME: " ++ (Usuario.nome user) ++ ", FUNÇÃO: " ++ (Usuario.funcao user) ++ "\n"
  appendFile "usuarios.txt" userStr
  return ()

escreverAtividade :: Atividade.Atividade -> IO()
escreverAtividade atividade = do
  let atvStr = "ID ATIVIDADE: " ++ show(Atividade.idAtividade atividade) ++ ", NOME: " ++ Atividade.nomeAtividade atividade ++ ", ID USER: " ++ Atividade.usuario atividade ++ ", STATUS: " ++ Atividade.status atividade ++ ", URGENCIA: " ++ Atividade.urgencia atividade++ ", DIFICULDADE: " ++ Atividade.dificuldade atividade++ ", DATA: " ++ Atividade.entrega atividade ++ "\n"
  appendFile "atividades.txt" atvStr
  return ()


verificaId :: Int -> [Usuario.Usuario] -> Bool
verificaId userId usuarios = not $ any (\usuario -> Usuario.idUsuario usuario == userId) usuarios

verificaStatus :: String -> Bool
verificaStatus "A fazer" = True
verificaStatus "Em andamento" = True
verificaStatus "Concluido" = True
verificaStatus _ = False
