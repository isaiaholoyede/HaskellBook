module Cipher where

import Data.Char(ord, chr, isUpper, isAlpha, toLower)
import System.IO

data Key = Caesar Int | Vigenere String deriving (Eq, Show)

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

message :: IO String
message = do 
  putStr "Please enter your message: "
  msg <- getLine
  return msg

cipherOption :: IO String
cipherOption = do
  putStr "Please select your cipher option:\n\
          \(C/c) caesar\n\
          \(V/v) vigenere\n\
          \> "
  opt <- getLine
  return opt

cipherKey :: String -> IO Key
cipherKey x =
  case f x of
    "c" -> do
       putStr "Please enter your shift number: "
       num <- getLine
       return (Caesar (read num))
    "v" -> do
       putStr "Please enter keyword for Vigenere cipher: "
       keyword <- getLine
       return (Vigenere keyword)
  where f = fmap toLower

cipherMessage :: String -> Key -> IO()
cipherMessage xs k =
  case k of
    (Caesar n) -> putStrLn $ "caesar: " ++ caesar n xs
    (Vigenere s) -> putStrLn $ "vigenere: " ++  vigenere s xs

decipherMessage :: String -> Key -> IO()
decipherMessage xs k =
  case k of
    (Caesar n) -> putStrLn $ "caesar: " ++ unCaesar n xs
    (Vigenere s) -> putStrLn $ "vigenere: " ++  unVigenere s xs

messageParameters = do
  hSetBuffering stdout NoBuffering
  msg <- message
  opt <- cipherOption
  key <- cipherKey opt
  return (msg, key)

encrypt :: IO()
encrypt = do
  (msg, key) <- messageParameters
  cipherMessage msg key

decrypt :: IO()
decrypt = do
 (msg, key) <- messageParameters
 decipherMessage msg key
