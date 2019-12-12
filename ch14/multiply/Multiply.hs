module Multiply where

import Test.Hspec

myMultiply :: (Eq a, Num a) => a -> a -> a
myMultiply _ 0 = 0
myMultiply x y = x + myMultiply x (y - 1)

main :: IO ()
main = hspec $
  describe "Multiplication" $
    it "5 multipled by 3 is 15" $
      myMultiply 5 3 `shouldBe` 15
