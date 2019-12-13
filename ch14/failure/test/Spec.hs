module Spec where

import Test.QuickCheck

-- Failure
-- This fails due to floating point arithmetic
square :: Num a => a -> a
square x = x * x

squareIdentity :: Floating a => a -> a
squareIdentity = square . sqrt

prop_SquareIdentity :: Double -> Bool
prop_SquareIdentity x = squareIdentity x == x

main :: IO ()
main = do
  putStrLn "\nSquare Function - This fails because of floating point arithmetic."
  quickCheck prop_SquareIdentity
