# Exercises: Parentheses and Association

```haskell
-- #1.
8 + 7 * 9
-- is not the same as
(8 + 7) * 9
-- Parentheses changes the results.
```

```haskell
-- #2
perimeter x y = (x * 2) + (y * 2)
-- is the same as
perimeter x y = x * 2 + y * 2
-- Parentheses does not change the results.
```

```haskell
f x = x / 2 + 9
-- is not the same as
f x = x / (2 + 9)
-- Parentheses change the results.
```
