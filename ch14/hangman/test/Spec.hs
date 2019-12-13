module Spec where

import Test.QuickCheck

-- allowedChars :: String
-- allowedChars = M.keys letterToMorse

-- allowedMorse :: [Morse]
-- allowedMorse = M.elems letterToMorse

-- charGen :: Gen Char
-- charGen = elements allowedChars

-- morseGen :: Gen Morse
-- morseGen = elements allowedMorse

-- prop_fillInCharacter :: Property
-- prop_fillInCharacter =
--     forAll charGen
--     (\c -> (charToMorse c
--     >>= morseToChar) == Just c)

-- prop_handleGuess :: Property
-- prop_handleGuess =
--     forAll charGen
--     (\c -> (charToMorse c
--     >>= morseToChar) == Just c)

main :: IO ()
main = do
    putStrLn "\nTest fillInCharacter function"
    -- quickCheck prop_fillInCharacter
    putStrLn "\nTest handleGuess function"
    -- quickCheck prop_handleGuess