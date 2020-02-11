module ZipListApplicative where

import Control.Applicative 
import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Checkers 
import Test.QuickCheck.Classes

data List a = Nil | Cons a (List a) 
    deriving (Eq, Show)

append :: List a -> List a -> List a 
append Nil ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

fold :: (a -> b -> b) -> b -> List a -> b 
fold _ b Nil = b
fold f b (Cons h t) = f h (fold f b t)

concat' :: List (List a) -> List a 
concat' = fold append Nil

take' :: Int -> List a -> List a 
take' n _   | n <= 0    = Nil
take' _ Nil             = Nil
take' n (Cons x xs)     = Cons x (take' (n - 1) xs)

instance Semigroup (List a) where
    xs <> ys = append xs ys 

instance Semigroup a => Monoid (List a) where
    mempty = Nil
    mappend = append

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Applicative List where 
    pure x              = Cons x Nil
    _ <*> Nil           = Nil
    Nil <*> _           = Nil
    (Cons f fs) <*> xs  = fmap f xs <> (fs <*> xs)

newtype ZipList' a = ZipList' (List a) deriving (Eq, Show)

instance Eq a => EqProp (ZipList' a) where 
    xs =-= ys = xs' `eq` ys'
        where xs' = let (ZipList' l) = xs 
                    in take' 3000 l
              ys' = let (ZipList' l) = ys 
                    in take' 3000 l

instance Functor ZipList' where 
    fmap f (ZipList' xs) = 
        ZipList' $ fmap f xs

zipWith' :: (a -> b -> c) -> List a -> List b -> List c
zipWith' _ Nil _                    = Nil
zipWith' _ _ Nil                    = Nil
zipWith' f (Cons x xs) (Cons y ys)  = Cons (x `f` y) (zipWith' f xs ys)

repeat' :: a -> List a
repeat' x = xs where xs = Cons x xs

-- toMyList :: [a] -> List a
-- toMyList = foldr Cons Nil

instance Applicative ZipList' where 
    pure x = ZipList' $ repeat' x
    liftA2 f (ZipList' xs) (ZipList' ys) = ZipList' (zipWith' f xs ys)

instance Arbitrary a => Arbitrary (List a) where
    arbitrary = Cons <$> arbitrary <*> arbitrary

instance Arbitrary a => Arbitrary (ZipList' a) where
    arbitrary = ZipList' <$> arbitrary

main :: IO()
main = 
    quickBatch $ applicative $ ZipList' (Cons (1 :: Int, 2 :: Int, 3 :: Int) Nil)
