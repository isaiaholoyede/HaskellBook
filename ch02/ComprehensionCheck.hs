-- Exercises: Comprehension Check
-- #1.
half x = x / 2
square x = x * x

-- #2.
area :: Floating a => a -> a 
area r = 3.14 * r * r

-- #3.
area' :: Floating a => a -> a 
area' r = pi * r * r
