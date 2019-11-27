module EnumFromTo where

eft :: (Enum a, Eq a, Ord a) => a -> a -> [a]
eft x y
  | x > y = []
  | otherwise = x : eft (succ x) y

eftBool :: Bool -> Bool -> [Bool]
eftBool = eft

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd = eft

eftInt :: Int -> Int -> [Int]
eftInt = eft

eftChar :: Char -> Char -> String
eftChar = eft
