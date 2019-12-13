module Spec where

import Test.QuickCheck

-- Gen Random Generator
data Fool = Fulse | Frue deriving (Eq, Show)

instance Arbitrary Fool where
  arbitrary = elements [Fulse, Frue]

foolGenEqual :: Gen Fool
foolGenEqual = arbitrary

foolGenNotEqual :: Gen Fool
foolGenNotEqual = frequency [(2, return Fulse),
                             (1, return Frue)]

main :: IO ()
main = do
  putStrLn "\n Data Generation for foolGenEqual"
  sample foolGenEqual
  putStrLn "\n Data Generation for foolGenNotEqual"
  sample foolGenNotEqual
