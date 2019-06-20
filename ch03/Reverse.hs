-- Chapter 3 Exercises
-- Building Functions
-- #5 & #6
module Reverse where

rvrs :: String -> String
rvrs x = drop 9 x ++ take 4 (drop 5 x) ++ take 5 x

main :: IO()
main = print $ rvrs "Curry is awesome"
