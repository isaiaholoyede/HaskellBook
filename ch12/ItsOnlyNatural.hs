module ItsOnlyNatural where

-- It's only Natural
data Nat = Zero | Succ Nat deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ x) = 1 + natToInteger x

integerToNat :: Integer -> Maybe Nat
integerToNat x = if x < 0 then Nothing else Just (f x)
  where f 0 = Zero
        f n = Succ (f (n - 1))
