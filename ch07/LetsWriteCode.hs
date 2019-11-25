module LetsWriteCode where

-- Let's write code
-- #1
tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

-- a)
tensDigit' :: Integral a => a -> a
tensDigit' x = d
  where xLast = fst $ divMod x 10
        d     = snd $ divMod xLast 10

tensDigit'' :: Integral a => a -> a
tensDigit'' x = d
  where (xLast, _) = divMod x 10
        (_, d) = divMod xLast 10

-- b)
-- The type signatures are the same.

-- c)
hunsD :: Integral a => a -> a
hunsD x = d
  where xLast = x `div` 100
        d     = xLast `mod` 10

-- #2
-- Pattern Matching Version
foldBool3 :: a -> a -> Bool -> a
foldBool3 x _ False = x
foldBool3 _ y True  = y

-- Case Expression Version
foldBool1 :: a -> a -> Bool -> a
foldBool1 x y z = case z of
  True -> y
  False -> x

-- Guard Version
foldBool2 :: a -> a -> Bool -> a
foldBool2 x y z
  | z == True = y
  | z == False = x

-- #3
g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c)