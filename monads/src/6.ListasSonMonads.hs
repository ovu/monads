module ListasSonMonads where

data Lista a = ListaVacia | Cons a (Lista a)
-- data [] a = [] | a : [] a

-- class Monad m where
--     (>>=)  :: m a -> (a -> m b) -> m b
--     return :: a -> m a

--- Implementación del Maybe Monad ---
-- instance Monad [] where
-- xs >>= f = concat (map f xs)
-- return x = [x]


--- Listas representan indeterminismo (ejemplo juegos) ---

-- combinarListas :: [Int] -> [Int] -> [(Int, Int)]
-- combinarListas primeraLista segundaLista = primeraLista >>= (\a -> segundaLista >>= (\b -> return (a, b)))

-- f :: Int -> [Int]

combinarListas :: [Int] -> [Int] -> [(Int, Int)]
combinarListas primeraLista segundaLista = do
                                            a <- primeraLista
                                            b <- segundaLista
                                            return (a, b)
