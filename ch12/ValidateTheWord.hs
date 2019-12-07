module ValidateTheWord where

-- Validate the word
newtype Word' = Word' String deriving (Eq, Show)

vowels = "aeiou"

-- #3. countVowels
countVowels :: String -> Integer
countVowels = toInteger . length . filter (`elem` "aeiou")

mkWord :: String -> Maybe Word'
mkWord xs
  | countVowels xs > countConsonants xs = Nothing
  | otherwise = Just (Word' xs)
  where countConsonants xs = (fromIntegral . length) xs - countVowels xs