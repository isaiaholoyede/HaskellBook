module Main where

import Cipher
import System.IO

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStr "Please enter the words you want to cipher: "
    words <- getLine
    putStrLn $ "The caesar is: " ++ caesar 7 words
    putStrLn $ "The vigenere is: " ++ vigenere "HELLO" words

    
