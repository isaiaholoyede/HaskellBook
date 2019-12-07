module EitherLibrary where

-- Small library for Either
lefts' :: [Either a b] -> [a]
lefts' [] = []
lefts' (Right x:xs) = lefts' xs
lefts' (Left x:xs) = x : lefts' xs

lefts'' = foldr f []
 where f (Left a) b = a:b
       f _        b = b

rights' :: [Either a b] -> [b]
rights' [] = []
rights' (Left x:xs) = rights' xs
rights' (Right x:xs) = x : rights' xs

rights'' = foldr f []
 where f (Right a) b = a:b
       f _        b = b

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' xs = (lefts'' xs, rights'' xs)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left a) = Nothing
eitherMaybe' f (Right b) = Just (f b)

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left a) = f a
either' _ g (Right b) = g b

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' g = either' (const Nothing) (Just . g)
