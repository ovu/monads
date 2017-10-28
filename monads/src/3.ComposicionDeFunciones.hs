module ComposicionDeFunciones where

convertirAString :: Int -> String
convertirAString numero = show numero

contarCaracteres :: String -> Int
contarCaracteres unaCadena = length unaCadena

contarDigitos :: Int -> Int
contarDigitos numero = (contarCaracteres . convertirAString) numero


