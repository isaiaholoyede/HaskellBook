module VarietyPack where

-- Exercises: Variety Pack
-- #1
-- a)
k :: (a, b) -> a
k (x, y) = x
-- The type of k is k (a, b) -> a

k1 :: Num a => a
k1 = k ((4 - 1), 10)

-- b)
k2 :: [Char]
k2 = k ("three", (1 + 2))
-- The type of k2 is [Char].
-- It is not the same type as k1 or k3

k3 :: Num a => a
k3 = k (3, True)

-- c)
-- k1 returns number 3
-- k3 returns number 3

-- #2
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, _, c) (d, _, f) = ((a, d), (c, f))
