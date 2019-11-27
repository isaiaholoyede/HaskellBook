module Cipher where

import Data.Char(ord, chr, isUpper, isAlpha)

caesarEncoder :: Int -> Char -> Char
caesarEncoder n c
  | isAlpha c = chr $ ordBase + (n + charToInt c) `mod` numAlpha
  | otherwise = c
  where
        charToInt c = ord c - ordBase
        base = if isUpper c then 'A' else 'a'
        ordBase = ord base
        numAlpha = 26

caesar :: Int -> String -> String
caesar n = map (caesarEncoder n)

unCaesar :: Int -> String -> String
unCaesar n = caesar (-n)
