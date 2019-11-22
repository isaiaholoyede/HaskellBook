## Exercises: Apply Yourself

```haskell
-- #1
(++) :: [a] -> [a] -> [a]
-- type signature is fully polymorphic.

myConcat :: [Char] -> [Char]
myConcat x = x ++ " yo"
-- type signature becomes [Char] -> [Char]
```

```haskell
-- #2
(*) :: Num a => a -> a -> a

myMult :: Fractional a => a -> a
myMult x = (x / 3) * 5
-- type signature becomes constrained to Fractional typeclass
```

```haskell
-- #3
take :: Int -> [a] -> [a]

myTake :: Int -> [Char]
myTake x = take x "hey you"
-- Type variable a becomes a concrete type [Char]
```

```haskell
-- #4
(>) :: Ord a => a -> a -> Bool

myCom :: Int -> Bool
myCom x = x > (length [1..10])
-- Type variable a becomes a concrete type Int because length [1..10] has a type signature Int.
```

```haskell
-- #5
(<) :: Ord a => a -> a -> Bool

myAlph :: Char -> Bool
myAlph x = x < 'z'
-- Type variable a becomes a concrete type Char because 'z' has a concrete type Char.
```
