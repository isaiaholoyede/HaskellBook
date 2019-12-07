module StringProcessing where

import Data.Char(toLower)

-- String Processing
-- #1. replaceThee

notThe :: String -> Maybe String
notThe xs = if f xs then Nothing else Just xs
    where f w = "the" `elem` (words . map toLower $ w)

replaceThe :: String -> String
replaceThe = unwords . map (f . notThe) . words
    where   f :: Maybe String -> String
            f Nothing = "a"
            f (Just xs) = xs

-- #2. countTheBeforeVowel
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel = f . words
    where   f [] = 0
            f (x:xs)
                | map toLower x == "the" && (vowelInitial . head) xs = 1 + f xs
                | otherwise = f xs
            vowelInitial (x:xs)
                | toLower x `elem` "aeiou" = True
                | otherwise = False

-- #3. countVowels
countVowels :: String -> Integer
countVowels = toInteger . length . filter (`elem` "aeiou")
    