# 4.9 Chapter Exercises
```haskell
awesome = ["Papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome = [awesome, alsoAwesome]

-- #1
-- length could have a type signature [a] -> Int
-- It takes a list of any type
-- It evaluates to a type of Int

-- #2
-- a) length [1, 2, 3, 4, 5]
5

-- b) length [(1, 2), (2, 3), (3, 4)]
3

-- c) length allAwesome
2

-- d) length (concat allAwesome)
5

-- #3
Prelude> 6 / 3
2.0
-- This works.
-- Prelude> 6 / length [1, 2, 3] returns an error
-- because length returns an Int datatype whereas
-- the operator (/) belongs to a Fractional typeclass
-- which has no instance for the Int datatype.
-- Int belongs to the Integral typeclass instead.


-- #4
-- Using a different operator
Prelude> 6 `div` length [1, 2, 3]
2
-- Alternatively
Prelude> 6 / fromIntegral (length [1, 2, 3])
2.0

-- #5
-- The type of the expression 2 + 3 == 5 is Bool.
-- The expected result is True.

-- #6
Prelude> let x = 5
Prelude> x + 3 == 5
False
-- The type of x is Num a => a
-- The type of x + 3 == 5 is Bool
-- The expected result is False.

-- #7
Prelude> length allAwesome == 2
True
-- This works because we are comparing two values of the same datatype Int.

-- Prelude> length [1, 'a', 3, 'b']
-- This does not work because a list cannot contain values of different datatypes.

Prelude> length allAwesome + length awesome
5
-- This works because we are adding values of the same datatype Int.

Prelude> (8 == 8) && ('b' < 'a')
False
-- This works because we are performing a boolean And operation on two values of the Bool datatype.
-- (8 == 8) is True and ('b' < 'a') is False, therefore True and False gives False.

-- Prelude> (8 == 8) && 9
-- This does not work because we are trying to compare Bool with a numeric datatype.
```

```haskell
-- #10
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = (,) (snd x, snd y) (fst x, fst y)
```

## Correcting syntax

```haskell
-- #1
x = (+)
f :: String -> Int
f xs = w `x` 1
  where w = length xs
```

```haskell
-- #2
myId :: a -> a
myId = \x -> x
```

```haskell
-- #3
f :: (a, b) -> a
f (a, b) = a
```

```haskell
-- Question from earlier edition
myHead :: [a] -> a
myHead = \(x:xs) -> x
```

## Match the function names to their types

1. The type of `show` is `Show a => a -> String` (option c).
2. The type of `(==)` is `Eq a => a -> a -> Bool` (option b).
3. The type of `fst` is `(a, b) -> a` (option a).
4. The type of `(+)` is `(+) :: Num a => a -> a -> a` (option d).
