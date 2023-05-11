module Usuario where

import Data.Char ()
import Data.Set ()
import qualified Data.Text.IO as TIO
import Data.Time
import System.Directory ()
import System.IO ()
import Data.List (find)

import Data.Maybe (mapMaybe)
import Text.Read (readMaybe)



data Usuario = Usuario {
  idUsuario :: Int, nome :: String, funcao :: String} deriving (Show, Read, Eq)

cadastraUsuario :: Int -> String -> String -> Usuario
cadastraUsuario idUsuario nome funcao = 
  (Usuario {idUsuario = idUsuario, nome = nome, funcao = funcao})

adicionarUsuario :: Usuario -> [Usuario] -> [Usuario]
adicionarUsuario usuario usuarios =
    case find (\u -> idUsuario u == idUsuario usuario) usuarios of
        Just _ -> usuarios
        Nothing -> usuario : usuarios


escreverUsuarios :: FilePath -> [Usuario] -> IO ()
escreverUsuarios arquivo usuarios = appendFile arquivo conteudo
  where
    conteudo = unlines $ map formatarUsuario usuarios
    formatarUsuario u = "ID: " ++ show (idUsuario u) ++ ", NOME: " ++ nome u ++ ", FUNÇÃO: " ++ funcao u

lerUsuarios :: FilePath -> IO [Usuario.Usuario]
lerUsuarios path = do
  conteudo <- readFile path
  let usuarios = mapMaybe Usuario.fromString $ lines conteudo
  return usuarios

fromString :: String -> Maybe Usuario
fromString str = case words str of
  [idStr, nome, funcao] -> do
    idUsuario <- readMaybe idStr
    return Usuario{idUsuario = idUsuario, nome = nome, funcao = funcao}
  _ -> Nothing

verificaIdExistente :: Int -> [Usuario] -> Bool
verificaIdExistente id usuarios = elem id (map Usuario.idUsuario usuarios)