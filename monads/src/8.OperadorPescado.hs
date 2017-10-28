module OperadorPescado where

import Data.Char
import Control.Monad

---------- Convertir cadena a entero -----------
convertirAInt :: String -> Maybe Int
convertirAInt "" = Nothing
convertirAInt cadena = if todosSonNumeros cadena
                       then Just(read cadena)
                       else Nothing
  where 
    todosSonNumeros laCadena = null ( todosLosQueNoSonNumeros laCadena )
    todosLosQueNoSonNumeros laCadena = filter (\a -> not (isDigit a)) laCadena


-------------- Buscar Personal en base de datos -----------------
data Persona = Persona Int String String deriving Show

buscarEnBDConId :: Int -> Maybe Persona 
buscarEnBDConId 100 = Just $ Persona 100 "Omar" "Vera"
buscarEnBDConId _ = Nothing


------------------ Operador Pescado ------------------------------
buscarPersonaEnBDConIdEnString :: String -> Maybe Persona
buscarPersonaEnBDConIdEnString = convertirAInt >=> buscarEnBDConId
