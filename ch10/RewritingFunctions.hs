module RewritingFunctions where
-- Rewriting functions using Folds

-- Example
myAnd :: [Bool] -> Bool
myAnd = foldr (&&) True

-- Question 1:
-- myOr
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = if x then True else myOr xs

myOr' :: [Bool] -> Bool
myOr' [] = False
myOr' (x:xs) = x || myOr xs

myOr'' :: [Bool] -> Bool
myOr'' = foldr (\x y -> x || y) False

myOr''' :: [Bool] -> Bool
myOr''' = foldr (||) False

-- Question 2:
-- myAny
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = if f x then True else myAny f xs

myAny' :: (a -> Bool) -> [a] -> Bool
myAny' _ [] = False
myAny' f (x:xs) = f x || myAny f xs

myAny'' :: (a -> Bool) -> [a] -> Bool
myAny'' f = foldr (\x y -> f x || y) False

-- Question 3:
-- myElem
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs) = a == x || myElem x xs

myElem' :: Eq a => a -> [a] -> Bool
myElem' x = any (==x)

myElem'' :: Eq a => a -> [a] -> Bool
myElem'' a = foldr (\x y -> a == x || y) False

-- Question 4:
-- myReverse
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

myReverse' :: [a] -> [a]
myReverse' = foldr (\a b -> b ++ [a]) []

-- Question 5:
-- myMap
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x y -> f x : y) []

-- Question 6:
-- myFilter
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f (x:xs) = if f x then x : myFilter f xs else myFilter f xs

myFilter' :: (a -> Bool) -> [a] -> [a]
myFilter' f = foldr (\x y -> if f x then x : y else y) []

-- Question 7:
-- squish
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

squish' :: [[a]] -> [a]
squish' = foldr (\a b -> a ++ b) []

squish'' :: [[a]] -> [a]
squish'' = foldr (++) []

-- Question 8:
-- squishMap
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

squishMap' :: (a -> [b]) -> [a] -> [b]
squishMap' f = foldr (\a b -> f a ++ b) []

-- Question 9:
-- squishAgain
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- Question 10:
-- myMaximumBy
myMaximumBy ::(a -> a-> Ordering) -> [a] -> a
myMaximumBy _ [] = error "Empty list"
myMaximumBy _ [x] = x
myMaximumBy f (x:xs)
  | f x y == GT = x
  | otherwise = y
  where y = myMaximumBy f xs

myMaximumBy' ::(a -> a-> Ordering) -> [a] -> a
myMaximumBy' _ [] = error "Empty list"
myMaximumBy' f (x:xs) = foldl (\a b -> if f a b == GT then a else b) x xs


-- Question 11:
-- myMinimumBy
myMinimumBy ::(a -> a-> Ordering) -> [a] -> a
myMinimumBy _ [] = error "empty list"
myMinimumBy _ [x] = x
myMinimumBy f (x:xs)
  | f x y == LT = x
  | otherwise = y
  where y = myMinimumBy f xs

myMinimumBy' ::(a -> a-> Ordering) -> [a] -> a
myMinimumBy' _ [] = error "empty list"
myMinimumBy' f (x:xs) = foldl (\a b -> if f a b == LT then a else b) x xs

-- myMaximum
myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

-- myMinimum
myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
