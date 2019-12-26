module MaybeAnotherMonoid where

import Control.Monad
import Data.Monoid
import Test.QuickCheck

data Optional a = Nada | Only a
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Optional a) where
  (<>) Nada x = x
  (<>) x Nada = x
  (<>) (Only a) (Only b) = Only (a <> b)

instance Monoid a => Monoid (Optional a) where
  mempty  = Nada
  mappend = (<>)

newtype First' a =
  First' {getFirst' :: Optional a}
  deriving (Eq, Show)

instance Semigroup a => Semigroup (First' a) where
  (<>) (First' a) (First' a') = First' (a <> a')

instance Monoid a => Monoid (First' a) where
  mempty  = First' Nada
  mappend = (<>)

firstMappend :: Monoid a
             => First' a
             -> First' a
             -> First' a
firstMappend = mappend

instance Arbitrary a => Arbitrary (Optional a) where
  arbitrary = frequency [(1, return Nada)
                        ,(1, fmap Only arbitrary)]

firstGen :: Arbitrary a => Gen (First' a)
firstGen =  First' <$> arbitrary
-- firstGen = do
--   a <- arbitrary
--   return (First' a)

instance Arbitrary a => Arbitrary (First' a) where
  arbitrary = firstGen

type FirstMappend =
     First' String
  -> First' String
  -> First' String
  -> Bool

type FstId =
  First' String -> Bool

monoidAssoc :: (Eq m, Monoid m)
            => m -> m -> m -> Bool
monoidAssoc a b c =
  (a <> (b <> c)) == ((a <> b) <> c)

monoidLeftIdentity :: (Eq m, Monoid m)
                   => m
                   -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity :: (Eq m, Monoid m)
                   => m
                   -> Bool
monoidRightIdentity a = (a <> mempty) == a

main :: IO ()
main = do
  quickCheck (monoidAssoc :: FirstMappend)
  quickCheck (monoidLeftIdentity :: FstId)
  quickCheck (monoidRightIdentity :: FstId)
