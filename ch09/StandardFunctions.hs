module StandardFunctions where

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = if x == False then False else myAnd xs

myAnd' :: [Bool] -> Bool
myAnd' [] = True
myAnd' (x:xs) = x && myAnd xs

myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs

myElem :: Eq a => a -> [a] -> Bool
myElem x xs = any (x==) xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy ::(a -> a-> Ordering) -> [a] -> a
myMaximumBy _ [] = error "empty list"
myMaximumBy _ [x] = x
myMaximumBy f (x:xs)
  | f x y == GT = x
  | otherwise = y
  where y = myMaximumBy f xs

myMinimumBy ::(a -> a-> Ordering) -> [a] -> a
myMinimumBy _ [] = error "empty list"
myMinimumBy _ [x] = x
myMinimumBy f (x:xs)
  | f x y == LT = x
  | otherwise = y
  where y = myMinimumBy f xs

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
