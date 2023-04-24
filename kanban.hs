import System.Directory
import System.IO
import Data.Char

data Usuario = Usuario {nome::String, funcao::String} deriving ( Eq, Ord, Show, Read )

cadastrarUsuario::IO ()
cadastrarUsuario = do
    putStr "Nome: "
    name <- getLine
    putStr "Função: "
    func <- getLine
    let usuario = Usuario {nome = name, funcao = func}
    escrever "usuarios.txt" usuario

escrever :: FilePath -> Usuario -> IO ()
escrever arquivo usuario = do
  usuarios <- ler arquivo
  let listaUsuario = usuarios ++ [usuario]
  writeFile path (unlines (map show listaUsuario))

ler :: FilePath -> IO [Usuario]
ler arquivo = do
  usuarios <- readFile arquivo
  let userStrings = lines usuarios
  return (map read userStrings)
