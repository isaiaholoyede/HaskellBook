module Spec where

import Test.QuickCheck

-- charGen :: Gen Char
-- charGen = elements ['a'..'z']

-- wordGen :: Gen String
-- wordGen = listOf charGen

-- sentenceGen :: Gen String
-- sentenceGen = unwords <$> listOf wordGen

-- intGen :: Gen Int
-- intGen = arbitrary

-- nonEmptyWordGen :: Gen String
-- nonEmptyWordGen = listOf1 charGen

-- prop_caesar :: Property
-- prop_caesar = forAll sentenceGen (\s ->
--     forAll intGen (\n -> (unCaesar n . caesar n $ s) == s))
-- prop_vigenere :: Property
-- prop_vigenere = forAll sentenceGen (\s ->
--     forAll nonEmptyWordGen (\w -> (unVigenere w . vigenere w $ s) == s))

main :: IO ()
main = do
    putStrLn "\nTest fillInCharacter function"
    -- quickCheck prop_fillInCharacter
    putStrLn "\nTest handleGuess function"
    -- quickCheck prop_handleGuess

