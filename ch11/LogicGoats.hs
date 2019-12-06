{-# LANGUAGE FlexibleInstances #-}
module LogicGoats where

-- Exercises: Logic Goats
--  1. An instance of the `TooMany` typeclass for the type `(Int, String)`
--  a) without `newtype`

class TooMany a where
  tooMany :: a -> Bool

-- Question #1
-- Write an instance of TooMany typeclass for the type (Int, String)
-- Without new type

instance TooMany (Int, String) where
  tooMany (n, xs)
    | n > 42 && not (null xs) = True
    | otherwise               = False

-- b) with `newtype`

newtype Goats  = Goats (Int, String)
  deriving (Eq, Show)

instance TooMany Goats where
  tooMany (Goats (n, xs))
    | n > 42 && not (null xs) = True
    | otherwise               = False

-- Question #2
-- Make another TooMany instance for (Int, Int)
-- Sum the values together
-- without newtype

instance TooMany (Int, Int) where
  tooMany (x, y) = x + y > 42

-- b) with `newtype`

newtype Goats' = Goats' (Int, Int)
  deriving (Eq, Show)

instance TooMany Goats' where
  tooMany (Goats' (x, y)) = x + y > 42

-- Question #3
-- Make another TooMany instance for (Num a, TooMany a) => (a, a)
instance TooMany Double where
  tooMany x = x > 42.0

instance TooMany Integer where
  tooMany x = x > 42

instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (x, y) = tooMany x && tooMany y
