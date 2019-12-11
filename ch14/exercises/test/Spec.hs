module Spec where

import Test.Hspec
import Test.QuickCheck
import WordNumberTest
import Data.Char(toUpper)
import Data.List(sort)

-- Gen Random Generator
data Fool = Fulse | Frue deriving (Eq, Show)

instance Arbitrary Fool where
  arbitrary = elements [Fulse, Frue]

foolGenEqual :: Gen Fool
foolGenEqual = arbitrary

foolGenNotEqual :: Gen Fool
foolGenNotEqual = frequency [(2, return Fulse),
                             (1, return Frue)]

-- #1 Half
half :: Fractional a => a -> a
half x = x / 2

halfIdentity :: Fractional a => a -> a
halfIdentity = (* 2) . half

prop_HalfIdentity :: Double -> Bool
prop_HalfIdentity x = halfIdentity x == x

-- #2 Ordered List
listOrdered :: Ord a => [a] -> Bool
listOrdered xs =
  snd $ foldr go (Nothing, True) xs
  where go _ status@(_, False) = status
        go y (Nothing, t) = (Just y, t)
        go y (Just x, t) = (Just y, x >= y)

prop_ListOrdered :: String -> Bool
prop_ListOrdered xs = (listOrdered . sort) xs == True

-- #3 Associative and Commutative Properties of Addition
plusAssociative :: (Eq a, Num a) => a -> a -> a -> Bool
plusAssociative x y z = x + (y + z) == (x + y) + z

prop_PlusAssociative :: Integer -> Integer -> Integer -> Bool
prop_PlusAssociative = plusAssociative

plusCommutative :: (Eq a, Num a) => a -> a -> Bool
plusCommutative x y = x + y == y + x

prop_PlusCommutative :: Integer -> Integer -> Bool
prop_PlusCommutative = plusCommutative

-- #4 Associative and Commutative Properties of Multiplication
multiplyAssociative :: (Eq a, Num a) => a -> a -> a -> Bool
multiplyAssociative x y z = x * (y * z) == (x * y) * z

prop_MultiplyAssociative :: Integer -> Integer -> Integer -> Bool
prop_MultiplyAssociative = multiplyAssociative

multiplyCommutative :: (Eq a, Num a) => a -> a -> Bool
multiplyCommutative x y = x * y == y * x

prop_MultiplyCommutative :: Integer -> Integer -> Bool
prop_MultiplyCommutative = multiplyCommutative

-- #5 Quot Rem and Div Mod Properties
prop_QuotRem :: Integer -> NonZero Integer -> Bool
prop_QuotRem x (NonZero y) = quot x y * y + rem x y == x

prop_DivMod :: Integer -> NonZero Integer -> Bool
prop_DivMod x (NonZero y) = div x y * y + mod x y == x

-- #6 Minus is neither Associative nor Commutative
minusAssociative :: (Eq a, Num a) => a -> a -> a -> Bool
minusAssociative x y z = x - (y - z) == (x - y) - z

prop_MinusAssociative :: Integer -> Integer -> Integer -> Bool
prop_MinusAssociative = minusAssociative
-- Minus is not associative

minusCommutative :: (Eq a, Num a) => a -> a -> Bool
minusCommutative x y = x - y == y - x

prop_MinusCommutative :: Integer -> Integer -> Bool
prop_MinusCommutative = minusCommutative
-- Minus is not commutative

-- #7. Reversing a List Twice is the same as
-- the identity of the List
prop_RevRev :: [Integer] -> Bool
prop_RevRev xs = (reverse . reverse) xs == id xs

-- #8a. Property for the definition of ($)
prop_DollarDefinition :: Blind (Int -> Int)
                      -> Int
                      -> Bool
prop_DollarDefinition (Blind f) x = (f $ x) == f x

-- #8b. Property for the definition of (.)
prop_ComposeDefinition :: Blind (Int -> Int)
                   -> Blind (Int -> Int)
                   -> Int
                   -> Bool
prop_ComposeDefinition (Blind f) (Blind g) x'
  = (f . g) x' == (\x -> f ( g x)) x'

-- #9a. (++) Functions
-- This fails
prop_NotPlusPlus :: String -> String -> Bool
prop_NotPlusPlus xs ys =
  foldr (:) xs ys == (++) xs ys

-- This works
prop_PlusPlus :: String -> String -> Bool
prop_PlusPlus xs ys =
  foldr (:) xs ys == (++) ys xs

-- #9b. Concat Functions
prop_Concat :: [[Int]] -> Bool
prop_Concat xs =
  foldr (++) [] xs == concat xs

-- #10. Length Take
-- This property does not always hold.
prop_LengthTake :: NonNegative Int
                -> NonEmptyList Int
                -> Bool
prop_LengthTake (NonNegative n) (NonEmpty xs) =
  length (take n xs) == n

-- #11. Read Show
prop_ReadShow :: Int -> Bool
prop_ReadShow x = read (show x) == x


-- Failure
-- This fails due to floating arithmetic
square :: Num a => a -> a
square x = x * x

squareIdentity :: Floating a => a -> a
squareIdentity = square . sqrt

prop_SquareIdentity :: Double -> Bool
prop_SquareIdentity x = squareIdentity x == x

-- Idempotence
twice, fourTimes :: (a -> a) -> a -> a
twice f = f . f
fourTimes = twice . twice

capitalizeWord :: String -> String
capitalizeWord = map toUpper

f :: String -> Bool
f x = (capitalizeWord x
       == twice capitalizeWord x)
      &&
      (capitalizeWord x
       == fourTimes capitalizeWord x)

prop_CapitalizeWord :: String -> Bool
prop_CapitalizeWord x = f x

f' :: Ord a => [a] -> Bool
f' x = (sort x == twice sort x) &&
       (sort x == fourTimes sort x)

prop_Sort :: [Integer] -> Bool
prop_Sort x = f' x

main :: IO ()
main = do
  putStrLn "\nWord Number"-- wordNumberTest
  runWordNumberTest
  putStrLn "\nHalf"
  quickCheck prop_HalfIdentity
  putStrLn "\nSort"
  quickCheck prop_ListOrdered
  putStrLn "\nPlus Associative"
  quickCheck prop_PlusAssociative
  putStrLn "\nPlus Commutative"
  quickCheck prop_PlusCommutative
  putStrLn "\nPlus Multiplication"
  quickCheck prop_MultiplyAssociative
  putStrLn "\nPlus Multiplication"
  quickCheck prop_MultiplyCommutative
  putStrLn "\nQuot Rem"
  quickCheck prop_QuotRem
  putStrLn "\nDiv Mod"
  quickCheck prop_DivMod
  putStrLn "\nMinus Not Associative"
  quickCheck prop_MinusAssociative
  putStrLn "\nMinus Not Commutative"
  quickCheck prop_MinusCommutative
  putStrLn "\nReverse Twice = Identity"
  quickCheck prop_RevRev
  putStrLn "\nDollar Definition"
  quickCheck prop_DollarDefinition
  putStrLn "\nCompose Definition"
  quickCheck prop_ComposeDefinition
  putStrLn "\nIncorrect (++) Definition"
  quickCheck prop_NotPlusPlus
  putStrLn "\n(++) Definition"
  quickCheck prop_PlusPlus
  putStrLn "\nConcat Definition"
  quickCheck prop_Concat
  putStrLn "\nLength Take"
  quickCheck prop_LengthTake
  putStrLn "\nRead Show"
  quickCheck prop_ReadShow
  putStrLn "\nSquare Function"
  quickCheck prop_SquareIdentity
  putStrLn "\nIdempotence - capitalizeWord"
  quickCheck prop_CapitalizeWord
  putStrLn "\nIdempotence - sort"
  quickCheck prop_Sort
