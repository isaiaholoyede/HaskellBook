# Exercises: More Bottoms

```haskell

-- #1
take 1 $ map (+1) [undefined, 2, 3]
-- This returns a bottom.
-- [*** Exception: Prelude.undefined

-- #2
take 1 $ map (+1) [1, undefined, 3]
-- This will return a value.
-- [2]

-- #3
take 2 $ map (+1) [1, undefined, 3]
-- This will return a bottom.
-- [2,*** Exception: Prelude.undefined

-- #4
-- Mystery function
-- This function takes a string and turns the string into a list of Bool, True for each occurrence of a vowel in the string, and False otherwise.
itIsMystery :: [Char] -> [Bool]
itIsMystery xs = map (\x -> elem x "aeiou") xs

-- #5
-- a)
map (^2) [1..10]
-- Result would be
-- [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

-- #5
-- b)
map minimum [[1..10], [10..20], [20..30]]
-- Result would be
-- [1, 10, 20]

-- #5
-- c)
map sum [[1..5], [1..5], [1..5]]
-- Result would be
[15, 15, 15]

```
