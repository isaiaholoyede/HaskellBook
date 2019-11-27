module ComprehendThyLists where

-- Exercises: Comprehend Thy Lists

-- Changed input of range from [1..5] to [1..10]
mySqr :: (Num a, Enum a) => [a]
mySqr = [x^2 | x <- [1..10]]
-- Results should be [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

myEvenSqr :: Integral a => [a]
myEvenSqr = [x | x <- mySqr, rem x 2 == 0]
-- Results should be [4, 16, 34, 64, 100]

myTupleSqr ::
  (Ord a, Ord b, Num a, Num b, Enum a, Enum b) =>
  [(a, b)]
myTupleSqr = [(x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50]
-- Results should be
-- [(1,64),(1,81),(1,100),(4,64),(4,81),(4,100),(9,64),(9,81),(9,100),(16,64),(16,81),(16,100),(25,64),(25,81),(25,100),(36,64),(36,81),(36,100),(49,64),(49,81),(49,100)]

myTakeTupleSqr ::
  (Ord a, Ord b, Num a, Num b, Enum a, Enum b) =>
  [(a, b)]
myTakeTupleSqr = take 5 myTupleSqr
-- Results should be [(1,64),(1,81),(1,100),(4,64),(4,81)]
