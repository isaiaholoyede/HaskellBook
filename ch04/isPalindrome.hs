-- #8
module IsPalindrome where

isPalindrome :: Eq a => [a] -> Bool
isPalindrome x = x == reverse x
