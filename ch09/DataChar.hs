module DataChar where

import Data.Char

--- #1
-- The type of isUpper is
-- isUpper :: Char -> Bool
-- The type of toUpper is
-- toUpper :: Char -> Char

-- #2
-- Filters all the uppercase letters out of a string
filterUpper :: String -> String
filterUpper = filter isUpper

-- #3
-- Capitalize the first letter of a String
capitalizeFirst :: String -> String
capitalizeFirst "" = ""
capitalizeFirst (x:xs) = toUpper x : xs

-- #4
-- Capitalize all
capitalize :: String -> String
capitalize "" = ""
capitalize (x:xs) = toUpper x : capitalize xs

-- #6
-- Capitalize head only
capitalizeHead :: String -> Char
capitalizeHead xs = toUpper (head xs)

-- composed and pointfree
capitalizeHead' :: String -> Char
capitalizeHead' = toUpper . head
