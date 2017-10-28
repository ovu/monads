module CiudadesBolivia where

data CiudadBolivia = Cbba    |
                       StaCruz |
                       Oruro   |
                       LaPaz   |
                       Tarija  |
                       Beni    |
                       Pando   |
                       Potosi  |
                       Sucre


---------- Implementar tipo de Clase show ------------
-- class Show a where
-- show :: a -> String

instance Show CiudadBolivia where
  show Cbba = "Cochabamba"
  show StaCruz = "Santa Cruz de la Sierra"
  show Oruro = "Oruro"
  show LaPaz = "La Paz"
  show Tarija = "Tarija"
  show Beni = "Beni"
  show Pando = "Pando"
  show Potosi = "Potosí"
  show Sucre = "Sucre"
