module Usuario where

import Data.Char ()
import Data.Set ()
import qualified Data.Text.IO as TIO
import Data.Time
import System.Directory ()
import System.IO ()


data Usuario = Usuario {
  idUsuario :: Int, nome :: String, funcao :: String} deriving (Show, Read, Eq)

cadastraUsuario :: Int -> String -> String -> Usuario
cadastraUsuario idUsuario nome funcao = 
  (Usuario {idUsuario = idUsuario, nome = nome, funcao = funcao})