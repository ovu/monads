module AsyncIO where

import Control.Concurrent
import Control.Concurrent.Async
import System.IO
import Control.Monad

getInfoFromUrls :: String -> String -> IO String
getInfoFromUrls url1 url2 = do a1 <- async (readFile url1)
                               a2 <- async (readFile url2)
                               archivo1 <- wait a1
                               archivo2 <- wait a2
                               return $ archivo1 ++ archivo2 
