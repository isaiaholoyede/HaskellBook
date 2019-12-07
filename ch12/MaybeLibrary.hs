module MaybeLibrary where

-- Small library for Maybe
isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust Nothing = False

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing (Just _) = False

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee b _ Nothing = b
mayybee _ f (Just a) = f a

fromMaybe :: a -> Maybe a -> a
fromMaybe a Nothing = a
fromMaybe _ (Just x) = x

fromMaybe' :: a -> Maybe a -> a
fromMaybe' a = mayybee a id

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:_) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just x) = [x]

catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes (Nothing : xs) = catMaybes xs
catMaybes (Just x:xs) = x : catMaybes xs

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe xs = if any isNothing xs
               then Nothing
               else Just (catMaybes xs)