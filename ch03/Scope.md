# Exercises: Scope

```haskell
-- #1
Prelude> let x = 5
Prelude> let y = 7
Prelude> let z = x * y
-- `y` is in scope for `z`
```

```haskell
-- #2
Prelude> let f = 3
Prelude> let g  = 6 * f + h
-- `h` is not in scope for function `g`.
```

```haskell
-- #3
area d = pi * (r * r)
r = d / 2
-- Everything we need to execute `area` is not in scope.
```

```haskell
-- #4
area d = pi * (r * r)
  where r = d / 2
-- `r` and `d` are now in scope for `area`.
```
