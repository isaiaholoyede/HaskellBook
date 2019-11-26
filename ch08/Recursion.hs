module Recursion where

-- Recursion

-- 1. Write out the steps for reducing dividedBy 15 2 
-- to its final answer.

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = f num denom 0
    where f n d count
            | n < d = (count, n)
            | otherwise = f (n-d) d (count + 1)

-- dividedBy 15 2 -- (7, 1)
-- dividedBy 15 2
-- f 15 2 0
-- f (15 - 2) 2 (0 + 1)
-- f 13 2 1
-- f (13 - 2) 2 (1 + 1)
-- f 11 2 2
-- f (11 - 2) 2 (2 + 1)
-- f 9 2 3
-- f (9 - 2) 2 (3 + 1)
-- f 7 2 4
-- f (7 - 2) 2 (4 + 1)
-- f 5 2 5
-- f (5 - 2) 2 (5 + 1)
-- f 3 2 6
-- f (3 - 2) 2 (6 + 1)
-- f 1 2 7
-- (7, 1)

-- 2. Function that recursively sums all numbers from 1 to n.
mySum :: (Eq a, Num a) => a -> a
mySum 0 = 0
mySum n = n + mySum (n - 1)
    
-- 3. Multiply two integral numbers using recursive summation

myMultiply :: (Eq a, Num a) => a -> a -> a
myMultiply _ 0 = 0
myMultiply x y = x + myMultiply x (y - 1)
    