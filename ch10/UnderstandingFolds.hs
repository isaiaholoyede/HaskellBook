module UnderstandingFolds where

-- Exercises: Understanding Folds
-- #1
-- foldr (*) 1 [1..5]` will return the same result as
--     b) `foldl (flip (*)) 1 [1..5]` and
--     c) `foldl (*) 1 [1..5]`.

-- `flip (*) 1 [1..5]` will throw an error because the function `flip` does not expect a list as one of its arguments.

-- #2
-- The evaluation steps for `foldl (flip (*)) 1 [1..3]` is shown below:

-- foldl (flip (*)) 1 [1,2,3]

-- Desugar the list
-- foldl (flip (*)) 1 (1:2:3:[])

-- recurse
-- foldl f z (x:xs) = foldl f ( f z x) xs
-- foldl (flip (*)) (flip (*) 1 1) (2:3:[])

-- recurse
-- foldl (flip (*)) (flip (*) (flip (*) 1 1) 2) (3:[])

-- recurse
-- foldl (flip (*)) (flip (*) (flip (*) (flip (*) 1 1) 2) 3) []

-- use base function
-- foldl f z [] = z
-- Recall that we are pattern matching
-- (flip (*) (flip (*) (flip (*) 1 1) 2) 3)

-- Apply functions to reduce the expressions
-- (flip (*) (flip (*) ((*) 1 1) 2) 3)
-- (flip (*) ((*) 2 ((*) 1 1)) 3)
-- ((*) 3 ((*) 2 ((*) 1 1)))
-- ((*) 3 ((*) 2 1))
-- ((*) 3 2)
-- 6

-- #3
-- One difference between `foldr` and `foldl` is:
--     c) `foldr`, but not `foldl`, associates to the right.

-- #4
-- Folds are catamorphisms, which means they are generally used to
--     a) reduce structure.

-- 5a. 
-- foldr (++) ["woot", "WOOT", "woot"]
-- This is missing the accumulator or identity value.
-- foldr (++) [] ["woot", "WOOT", "woot"]
a = foldr (++) "" ["woot", "WOOT", "woot"]

-- 5b.
-- foldr max [] "fear is the little death"
b = foldr max [] $ words "fear is the little death"

-- 5c.
-- foldr and True [False, True]
c = foldr (&&) True [False, True]

-- 5d.
-- foldr (||) True [False, True]
-- The identify value for the (||) function is False, not True. 
-- If we had kept this as True, 
-- it will never return a different answer.
d = foldr (||) False [False, True]

-- 5e.
--  foldl ((++) . show) "" [1..5]
e = foldl (flip ((++) . show)) "" [1..5]

-- 5f.
-- foldr const 'a' [1..5]
f = foldr const 0 [1..5]

-- 5g.
-- foldr const 0 "tacos"
g = foldr const 'a' "tacos"

-- 5h.
-- foldl (flip const) 0 "burritos"
h = foldl (flip const) 'a' "burritos"

-- 5i.
-- foldl (flip const) 'z' [1..5]
i = foldl (flip const) 0 [1..5]
