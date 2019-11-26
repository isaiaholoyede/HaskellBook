module WriteTheFunction where

--  Given a Type, Write the Function

-- This is the same as the identify function `id`.
-- #1 
i :: a -> a
i x = x

-- #2
c :: a -> b -> a
c x _ = x

-- `c` and `c''` are alpha equivalent.
-- #3
c'' :: b -> a -> b
c'' x _ = x

-- #4
c' :: a -> b -> b
c' _ y = y

-- There are multiple possibilities. These include:
-- #5
-- Tail function for a list
r :: [a] -> [a]
r (_:xs) = xs
r [] = []

-- Identity function for a list
r' :: [a] -> [a]
r' x = x

-- #6
co :: (b -> c) -> (a -> b) -> a -> c
co f g x = f (g x)

-- #7
a :: (a -> c) -> a -> a
a _ x = x

-- #8
a' :: (a -> b) -> a -> b
a' f x = f x
