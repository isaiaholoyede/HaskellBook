module Extract where
-- #2
addExclamation :: String -> String
addExclamation xs = xs ++ "!"

extractCharacter :: String -> Int -> String
extractCharacter xs n = take 1 $ drop n $ addExclamation xs

extractString :: String -> Int -> String
extractString xs n = drop n $ addExclamation xs