module Filtering where

multipleOfThree :: Integral a => [a] -> [a]
multipleOfThree = filter (\x -> (rem x 3) == 0)

lengthMultipleOfThree :: Integral a => [a] -> Int
lengthMultipleOfThree = length . filter (\x -> (rem x 3) == 0)

myFilter :: String -> [String]
myFilter = filter (\x -> notElem x ["the", "a", "an"]) . words 
