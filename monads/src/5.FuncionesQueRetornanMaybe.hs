module FuncionesQueRetornanMaybe where

import Data.Char

--------- Convertir cadena a entero ---------------
convertirAInt :: String -> Maybe Int
convertirAInt "" = Nothing
convertirAInt cadena = if todosSonNumeros cadena
                       then Just(read cadena)
                       else Nothing
  where 
    todosSonNumeros laCadena = null ( todosLosQueNoSonNumeros laCadena )
    todosLosQueNoSonNumeros laCadena = filter (\a -> not (isDigit a)) laCadena


---------- Buscar persona en base de datos -----------------
data Persona = Persona Int String String deriving Show

buscarEnBDConId :: Int -> Maybe Persona
buscarEnBDConId 100 = Just $ Persona 100 "Omar" "Vera"
buscarEnBDConId _ = Nothing

-- Buscar una persona en la base de datos dado su Id en String
buscarPersonaEnBDConIdEnString :: String -> Maybe Persona
buscarPersonaEnBDConIdEnString idPersona = case convertirAInt idPersona of
                                                Nothing -> Nothing
                                                Just(elId) -> case buscarEnBDConId elId of
                                                                    Nothing -> Nothing
                                                                    Just(persona) -> Just(persona)

----------- Conector ----------
conector :: Maybe a -> (a -> Maybe b) -> Maybe b
conector Nothing  _ = Nothing
conector (Just x) f = f x


------- Usando el conector --------------
buscarPersonaEnBDConIdEnString2 :: String -> Maybe Persona
buscarPersonaEnBDConIdEnString2 idPersona = convertirAInt idPersona `conector` buscarEnBDConId



--------- Mejorando el Conector -------------
(>>-) :: Maybe a -> (a -> Maybe b) -> Maybe b
(>>-) Nothing  _ = Nothing
(>>-) (Just x) f = f x

buscarPersonaEnBDConIdEnString3 :: String -> Maybe Persona
buscarPersonaEnBDConIdEnString3 idPersona = convertirAInt idPersona >>- buscarEnBDConId

--------- Podemos buscar dado un Int? ----------------

buscarPersonaEnBDConIdEnInt :: Int -> Maybe Persona
buscarPersonaEnBDConIdEnInt idPersona = Just idPersona >>- buscarEnBDConId

--- Un nivel más de abstracción: Type Classes ---
-- class Monad m where
--     (>>=)  :: m a -> (a -> m b) -> m b
--     return :: a -> m a

--- Implementación del Maybe Monad ---
-- instance Monad Maybe where
--     Nothing  >>= f = Nothing
--     (Just x) >>= f = f x
--     return         = Just

--- Usando el Maybe Monad ---
buscarPersonaEnBDConIdEnString4 :: String -> Maybe Persona
buscarPersonaEnBDConIdEnString4 idPersona = convertirAInt idPersona >>= buscarEnBDConId

--- Usando la Notación do ---
buscarPersonaEnBDConIdEnString5 :: String -> Maybe Persona
buscarPersonaEnBDConIdEnString5 idPersona = do
                                         idInt <- convertirAInt idPersona
                                         persona <- buscarEnBDConId idInt
                                         return persona

