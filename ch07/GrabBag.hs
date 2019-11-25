module GrabBag where

-- Exercises: Grab Bag
-- 1. The following functions are equivalent:
-- a), b), c), & d) are equivalent.
mTh, mTh', mTh'', mTh''' :: Num a => a -> a -> a -> a
mTh x y z = x * y * z
mTh' x y = \z -> x * y * z
mTh'' x = \y -> \z -> x * y * z
mTh''' = \x -> \y -> \z -> x * y * z

-- 2. The type of mTh (above) is `Num a => a -> a -> a -> a`. 
-- Which is the type of `mTh 3`? d) `Num a => a -> a -> a`

-- 3. Practice writing anonymous lambda syntax.
-- a)
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f n = n + 1

addOneIfOdd' n = case odd n of
  True -> f n
  False -> n
  where f = \n -> n + 1

-- b)
addFive x y = (if x > y then y else x) + 1
addFive' = \x y -> (if x > y then y else x) + 1

-- c)
mflip f = \x -> \y -> f y x
mflip' = \f -> \x -> \y -> f y x
