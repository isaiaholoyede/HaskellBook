module Cipher where

import Data.Char(ord, chr, isUpper, isAlpha)

base :: Char -> Char
base c = if isUpper c then 'A' else 'a'

ordBase :: Char -> Int
ordBase = ord . base

charToInt :: Char -> Int
charToInt c = ord c - ordBase c

caesarEncoder :: Int -> Char -> Char
caesarEncoder n c
  | isAlpha c = chr $ ordBase c + (n + charToInt c) `mod` 26
  | otherwise = c

caesar :: Int -> String -> String
caesar n = map (caesarEncoder n)

unCaesar :: Int -> String -> String
unCaesar n = caesar (-n)

offset :: Char -> Int
offset c
  | isAlpha c = charToInt c
  | otherwise = 0

vigenereEncoder :: Char -> Char -> Char
vigenereEncoder x y = caesarEncoder (offset y) x

vigenereDecoder :: Char -> Char -> Char
vigenereDecoder x y = caesarEncoder (negate . offset $ y) x

vigenere' :: (Char -> Char -> Char) -> String -> String -> String
vigenere' _ [] _ = ""
vigenere' _ _ [] = ""
vigenere' f (x:xs) t@(y:ys)
  | isAlpha x = f x y : vigenere' f xs ys
  | otherwise = x : vigenere' f xs t

vigenere :: String -> String -> String
vigenere xs ys = vigenere' vigenereEncoder ys (cycle xs)

unVigenere :: String -> String -> String
unVigenere xs ys = vigenere' vigenereDecoder ys (cycle xs)
