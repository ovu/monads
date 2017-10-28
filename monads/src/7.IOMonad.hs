module IOMonad where

import Data.Char

leerArchivo :: String -> String -> IO String
leerArchivo primerArchivo segundoArchivo = do
                primerContenido <- readFile primerArchivo
                segundoContenido <- readFile segundoArchivo
                return $ primerContenido ++ segundoContenido
