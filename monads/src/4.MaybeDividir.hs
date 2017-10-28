module Dividir where

dividir :: Int -> Int -> Maybe Int

dividir a 0 = Nothing

dividir a b = Just( div a b )

