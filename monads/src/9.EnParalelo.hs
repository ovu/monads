module EnParalelo where

import Control.Monad
import Control.Monad.Par (Par, spawn_, get, runPar, runParIO)

leerArchivosEnParalelo :: String -> String -> IO String
leerArchivosEnParalelo a b = runParIO $ do 
                                    fx <- spawn_ (readFile a)
                                    fy <- spawn_ (readFile b)
                                    x <- get fx 
                                    y <- gt fy
                                    return (a ++ b)
