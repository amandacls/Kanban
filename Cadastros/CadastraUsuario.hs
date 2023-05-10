import Data.Char ()
import Data.Set ()
import qualified Data.Text.IO as TIO
import Data.Time
import System.Directory ()
import System.IO ()

verificaId :: Int -> IO Bool
verificaId userId = do
  usuarios <- lerArquivoUsuarios
  return $ not $ any (\usuario -> idUsuario usuario == userId) usuarios

cadastrarUsuario :: IO ()
cadastrarUsuario = do
  putStr "Nome: "
  nome <- getLine
  putStr "Função: "
  funcao <- getLine
  putStr "Digite um id de até 6 números: "
  userId <- getLine
  let iduser = read userId :: Int
  if (verificaId iduser == False) then do
    putStrLn "ID Inválido, por favor tente outro número."
    cadastrarUsuario
  else do
    let usuario = Usuario {idUsuario = iduser, nome = nome, funcao = funcao}
        usuarioStr = show usuario ++ "\n"
  -- verifica a existencia de um usuario com o mesmo ID criar uma função genérica para isso
    appendFile "usuarios.txt" usuarioStr
    putStrLn "Usuário cadastrado com sucesso! Seu id de usuário é: " ++ show iduser