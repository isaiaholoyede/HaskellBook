# Exercises: Type Arguments

1. a)
```haskell
f :: a -> a -> a -> a
f 'x' :: Char -> Char -> Char
```

2. d)
```haskell
g :: a -> b -> c -> b
g 0 'c' "woot" :: Char
```

3. d)
```haskell
h :: (Num a, Num b) => a -> b -> b
h 1.0 2 :: Num b => b
```

4. c)
```haskell
h :: (Num a, Num b) => a -> b -> b
h 1 (5.5 :: Double) :: Double
```

5. a)
```haskell
jackal :: (Ord a, Eq b) => a -> b -> a
jackal "keyboard" "has the word jackal in it" :: [Char]
```
6. e)
```haskell
jackal :: (Ord a, Eq b) => a -> b -> a
jackal "keyboard" :: Eq b => b -> [Char]
```

7. d)
```haskell
kessel :: (Ord a, Num b) => a -> b -> a
kessel 1 2 :: (Num a, Ord a) => a
```

8. a)
```haskell
kessel :: (Ord a, Num b) => a -> b -> a
kessel 1 (2 :: Integer)  :: (Ord a, Num a) => a
```

9. c)
```haskell
kessel :: (Ord a, Num b) => a -> b -> a
kessel (1 :: Integer) 2 :: Integer
```
