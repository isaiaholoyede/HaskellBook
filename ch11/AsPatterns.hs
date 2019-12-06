module AsPatterns where

import Data.Char(toUpper, isSpace)
import Data.List

-- 1. isSubsequenceOf
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf t@(x:xs) (y:ys)
  | x == y = isSubseqOf xs ys
  | otherwise = isSubseqOf t ys

-- 2. capitalizeWords
capitalizeWords :: String -> [(String, String)]
capitalizeWords xs = map f $ words xs
  where f t@(x:xs) = (t, toUpper x : xs)

-- Language Exercise
-- 1. Write a function that capitalizes a word.
capitalizeWord :: String -> String
capitalizeWord "" = ""
capitalizeWord (x:xs) = toUpper x : xs

-- 2. Write a function that capitalizes sentences in a paragraph.
-- Recognize when a new sentence has begun by checking for periods.
-- Reuse the capitalizeWord function.

myTokenizer :: (String -> [String])
                -> Char -> String -> [String]
myTokenizer t c "" = []
myTokenizer t c xs = f xs : t (h . g $ xs)
  where f = takeWhile (/=c)
        g = dropWhile (/=c)
        h = dropWhile (==c)

mySentences :: String -> [String]
mySentences = myTokenizer mySentences '.'

trimLeft :: String -> String
trimLeft = dropWhile isSpace

addPeriod :: String -> String
addPeriod xs = xs ++ "."

capitalizeParagraph :: String -> String
capitalizeParagraph xs = unwords $ map f $ mySentences xs
  where f = addPeriod . capitalizeWord . trimLeft
