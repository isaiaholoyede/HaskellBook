# Exercises: Will They Work?

```haskell
-- #1.
max (length [1, 2, 3]) (length [8, 9, 10, 11, 12])
-- This will work
-- Result will be 5
-- This will work because the arguments to max are of the same type Int.
```

```haskell
-- #2
compare (3 * 4) (3 * 5)
-- This will work
-- Result will be LT
-- This will work because the arguments to max are constrained to the Num typeclass.
```

```haskell
-- #3
-- compare "Julie" True
-- This will not work
-- This will throw an error because we are trying to compare [Char] type with a Bool type. It will not typecheck.
```

```haskell
-- #4
(5 + 3) > (3 + 6)
-- This will work
-- Result will be False
-- This will work because the types of the arguments to the function (>) are constrained to the Num typeclass.
```
