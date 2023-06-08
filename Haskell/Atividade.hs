module Atividade where

import Data.Char ()
import Data.Set ()
import qualified Data.Text.IO as TIO
import Data.Time
import System.Directory ()
import System.IO ()

data Atividade = Atividade {idAtividade :: Int
, nomeAtividade :: String
, usuario :: String
, status :: String
, urgencia :: String
, dificuldade :: String
, entrega :: String} deriving (Show, Read, Eq)

cadastrarAtividade :: Int -> String -> String -> String -> String -> String -> String -> Atividade
cadastrarAtividade idAtividade nomeAtividade usuario status urgencia dificuldade entrega =
  (Atividade {idAtividade=idAtividade, nomeAtividade=nomeAtividade, usuario=usuario, status=status, urgencia=urgencia, dificuldade=dificuldade, entrega=entrega})

verificaOpcao :: String -> Bool
verificaOpcao opcao = opcao `elem` ["1", "2", "3", "4"]
