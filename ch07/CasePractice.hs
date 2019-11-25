module CasePractice where

functionC :: Ord a => a -> a -> a
functionC x y = case f of
  True -> x
  False -> y
  where f = x > y

ifEvenAdd2 :: (Ord a, Integral a) => a -> a
ifEvenAdd2 n = case f of
  True -> n + 2
  False -> n
  where f = even n

nums :: (Ord a, Num a) => a -> a
nums x = case z of
  LT -> -1
  GT -> 1
  EQ -> 0
  where z = compare x 0
