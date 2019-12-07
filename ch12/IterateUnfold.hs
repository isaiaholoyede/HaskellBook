module IterateUnfold where

--Write your own iterate and unfoldr
myIterate :: (a -> a) -> a -> [a]
myIterate f a = a : myIterate f (f a)

myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f b = case f b of
  Nothing -> []
  Just (a, b) -> a : myUnfoldr f b

betterIterate :: (a -> a) -> a -> [a]
betterIterate f = myUnfoldr (\a -> Just (a, f a))
