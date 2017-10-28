module CiudadesBolivia(CiudadPoblacion (..)) where

data CiudadPoblacion = Cbba Integer |
                       StaCruz  Integer|
                       Oruro Integer |
                       LaPaz Integer |
                       Tarija Integer |
                       Beni Integer |
                       Pando  Integer|
                       Potosi  Integer|
                       Sucre Integer deriving Show


poblacionEnCiudad :: CiudadPoblacion -> Integer

poblacionEnCiudad (Cbba x) = x
poblacionEnCiudad (StaCruz x) = x
poblacionEnCiudad (Oruro x) = x
poblacionEnCiudad (LaPaz x) = x
poblacionEnCiudad (Tarija x) = x
poblacionEnCiudad (Beni x) = x
poblacionEnCiudad (Pando x) = x
poblacionEnCiudad (Potosi x) = x
poblacionEnCiudad (Sucre x) = x

