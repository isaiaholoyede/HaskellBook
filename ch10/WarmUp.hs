module WarmUp where

stops, vowels :: String
stops  = "pbtdkg"
vowels = "aeiou"

-- Question 1a:
-- Write a function that takes inputs from stops and vowels and makes 3-tuples
-- of all possible stop-vowel-stop combinations
stringWord :: String -> String -> [(Char, Char, Char)]
stringWord xs ys = [ (x, y, x') | x <- xs, y <- ys, x' <- xs]

-- Question 1b
-- Modify the function so that it only returns the combinations
-- that begin with a p.
stringWordP :: String -> String -> [(Char, Char, Char)]
stringWordP xs ys = [ (x,y,x') | x <- xs, y <- ys, x' <- xs, x == 'p']

-- Question 1c
-- Set up lists of nouns and verbs and modify the function to make tuples
-- representing possible noun-verb-noun sentences
nouns, verbs :: [String]
nouns = ["rock", "paper", "scissors"]
verbs = ["crushes", "covers", "cuts"]

stringSentence :: [String] -> [String] -> [(String, String, String)]
stringSentence xs ys = [ (x, y, x') | x <- xs, y <- ys, x' <- xs]

-- Question 2
-- What does the mystery function seekritFunc do?
-- seekritFunc gives the average number of characters per word
seekritFunc :: String -> Int
seekritFunc x = div (sum (map length (words x)))
           (length (words x))

-- Question 3
-- Rewrite using fractional division
seekritFunc' :: Fractional a => String -> a
seekritFunc' x = (fromIntegral . sum . map length . words) x
  / (fromIntegral . length . words) x
