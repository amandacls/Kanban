module Utils where

import Data.Time (parseTimeM, defaultTimeLocale)
import Data.Map as Map (fromList, Map)
import Data.List
--import System.IO.Unsafe (unsafeDupablePerformIO)
--import Data.List.Split (splitOn)
--import Data.Typeable
--import Data.Time.Calendar
--import qualified System.IO.Strict as Strict

import qualified Atividade as Atividade
import qualified Usuario as Usuario
--import qualified ExibirQuadro as ExibirQuadro
--import qualified EditarAtividades as EditarAtividades

lerArquivoUsuarios :: IO([Usuario.Usuario])
lerArquivoUsuarios = do
  conteudo <- readFile "usuarios.txt"
  return $ map read (lines conteudo)

--escreverUsuario :: Usuario.Usuario -> IO ()
--escreverUsuario usuario = do
--  meu_arquivo <- openFile "usuarios.txt" WriteMode
--  let user = show usuario
--  hPutStr meu_arquivo user
--  hFlush meu_arquivo

--escreverAtividade :: Atividade.Atividade -> IO ()
--escreverAtividade atividade = do
--  meu_arquivo <- openFile "atividades.txt" WriteMode
--  let atv = show atividade
--  hPutStr meu_arquivo atv
--  hFlush meu_arquivo

exibir :: IO ([Atividade.Atividade])
exibir = do
  meu_arquivo <- readFile "Dados/atividades.txt"
  let lista = ((Data.List.map words (lines meu_arquivo)))
  let lista_atividade = (Data.List.map constroiAtividade lista)
  return lista_atividade

--constroiAtividade:: [String] -> Atividade.Atividade
--constroiAtividade lista = 
--  Atividade.Atividade {Atividade.idAtividade = lista !! 0
--  , Atividade.nomeAtividade = lista !! 1
--  , Atividade.status = lista !! 2
--  , Atividade.urgencia = lista !! 3
--  , Atividade.dificuldade = lista !! 4
--  , Atividade.entrega = lista !! 5}

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



--escreverUsuario::[Usuario.Usuario] -> IO()
--escrever [] = return ()
--escrever (h:t) = do
--  let userStr = Usuario.nome h ++ ", " ++ Usuario.funcao ++ ", " ++ show (Usuario.idUsuario)
--  appendFile "Dados/usuarios.txt" userStr
--  escreverUsuario t
--  return ()

escreverUsuario :: Usuario.Usuario -> IO()
escreverUsuario user = do
  let userStr = Usuario.nome user++ ", " ++ Usuario.funcao user++ ", " ++ show (Usuario.idUsuario user)
  appendFile "Dados/usuarios.txt" userStr
  return ()

escreverAtividade :: Atividade.Atividade -> IO()
escreverAtividade atividade = do
  let atvStr = show(Atividade.idAtividade atividade) ++ ", " ++ Atividade.nomeAtividade atividade ++ ", " ++ Atividade.usuario atividade ++ ", " ++ Atividade.status atividade ++ ", " ++ Atividade.urgencia atividade++ ", " ++ Atividade.dificuldade atividade++ ", " ++ Atividade.entrega atividade
  appendFile "Dados/atividades.txt" atvStr
  return ()

verificaId :: Int -> IO Bool
verificaId userId = do
  usuarios <- lerArquivoUsuarios
  return $ not $ any (\usuario -> Usuario.idUsuario usuario == userId) usuarios

verificaStatus :: String -> Bool
verificaStatus "A fazer" = True
verificaStatus "Em andamento" = True
verificaStatus "Concluido" = True
verificaStatus _ = False
