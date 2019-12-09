module Palindrome where

import System.IO
import Control.Monad (forever)
import System.Exit (exitSuccess)
import Data.Char (toLower)

-- Exercise 2 & 3
palindrome :: IO ()
palindrome = forever $ do
    line1 <- getLine
    let line2 = stripUnwanted $ map toLower line1
    if line2 == reverse line2 
        then putStrLn "It's a palindrome"
        else (do
            putStrLn "Nope!"
            exitSuccess)

stripUnwanted :: String -> String
stripUnwanted = filter (/='\'') . filter (/=' ')