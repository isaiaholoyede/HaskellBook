# Exercises: Parametricity

```haskell
-- #1
f :: a -> a
f a = a
-- This function cannot do anything else other than returning the same type as that of the given value.
```
```haskell
-- #2
f :: a -> a -> a
f a b = a
f' a b = b
```
```haskell
-- #3
f :: a -> b -> b
f a b = b
-- It can only have one implementation.
-- The behavior changes when the types of b changes, but not when the type of a changes.
```
