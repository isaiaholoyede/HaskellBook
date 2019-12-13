module Spec where

import Test.QuickCheck
import Data.Char(toUpper)
import Data.List(sort)

-- Idempotence
twice, fourTimes :: (a -> a) -> a -> a
twice f = f . f
fourTimes = twice . twice

capitalizeWord :: String -> String
capitalizeWord = map toUpper

f :: String -> Bool
f x = (capitalizeWord x
       == twice capitalizeWord x)
      &&
      (capitalizeWord x
       == fourTimes capitalizeWord x)

prop_CapitalizeWord :: String -> Bool
prop_CapitalizeWord = f 

f' :: Ord a => [a] -> Bool
f' x = (sort x == twice sort x) &&
       (sort x == fourTimes sort x)

prop_Sort :: [Integer] -> Bool
prop_Sort = f'

main :: IO ()
main = do
  putStrLn "\nIdempotence - sort"
  quickCheck prop_Sort
