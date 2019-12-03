module ScanExercises where

fibs = 1 : scanl (+) 1 fibs
fibsN x = fibs !! x

-- Question 1:
-- Modify your fibs function to only return the first 20 Fibonacci numbers
fibs20 :: [Integer]
fibs20 = take 20 fibs

-- Question 2:
-- Modify fibs to return the Fibonacci numbers that are less than 100
fibs100 :: [Integer]
fibs100 = takeWhile (<100) fibs

-- Question 2:
-- Try to write factorial function from Recursion as a scan
factorial :: [Integer]
factorial = scanl (*) 1 [1..]

factorialN :: Int -> Integer
factorialN n = factorial !! n
