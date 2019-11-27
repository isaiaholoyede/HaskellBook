module SquareCube where
-- Exercises: Square Cube

mySqr :: (Num a, Enum a) => [a]
mySqr = [x^2 | x <- [1..5]]
-- Results should be [1, 4, 9, 16, 25]

myCube :: (Num a, Enum a) => [a]
myCube = [y^3 | y <- [1..5]]
-- Results should be [1, 8, 27, 64, 125]

-- #1
-- An expression that will make tuples of the outputs of mySqr and myCube
mySqrCubeTuple :: (Num a, Enum a) => [(a, a)]
mySqrCubeTuple = [(x, y) | x <- mySqr, y <- myCube]
-- Result should be
-- [(1,1),(1,8),(1,27),(1,64),(1,125),(4,1),(4,8),(4,27),(4,64),(4,125),(9,1),(9,8),(9,27),(9,64),(9,125),(16,1),(16,8),(16,27),(16,64),(16,125),(25,1),(25,8),(25,27),(25,64),(25,125)]

-- #2
-- Only x and y values that are less than 50
mySqrCubeTuple' :: (Num a, Enum a, Ord a) => [(a, a)]
mySqrCubeTuple' = [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]
-- Result should be
-- [(1,1),(1,8),(1,27),(4,1),(4,8),(4,27),(9,1),(9,8),(9,27),(16,1),(16,8),(16,27),(25,1),(25,8),(25,27)]

-- #3
-- Determine # of tuples
lengthMySqrCubeTuple :: Int
lengthMySqrCubeTuple = length mySqrCubeTuple'
-- Result is 15
