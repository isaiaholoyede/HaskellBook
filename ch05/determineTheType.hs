{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

example = 1

-- 1. Value and Type
-- a) `(* 9) 6` 
--      returns value :: type `54 :: Num a => a`
-- b) `head [(0,"doge"),(1,"kitteh")]` 
--      returns value :: type `(0,"doge") :: Num a => (a, [Char])`
-- c) `head [(0 :: Integer ,"doge"),(1,"kitteh")]` 
--      returns value :: type `(0,"doge") :: (Integer, [Char])`
-- d) `if False then True else False` 
--      returns value :: type `False :: Bool`
-- e) `length [1, 2, 3, 4, 5]`
--      returns value :: type `5 :: Int`
-- f) `(length [1, 2, 3, 4]) > (length "TACOCAT")` 
--      returns value :: type `False :: Bool`

x = 5
y = x + 5
w = y * 10

-- The type of `w` is `w :: Num a => a`
z y = y * 10

-- The type of `z` is `z :: Num a => a -> a`

f = 4 / y

-- The type of `f` is `f :: Fractional a => a`

x' = "Julie"
y' = " <3 "
z' = "Haskell"
f' = x' ++ y' ++ z'

-- The type of f` is  `f :: [Char]`
