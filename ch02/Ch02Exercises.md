# Chapter Exercises

## Parenthesization

1. `2 + 2 * 3 - 1 == 2 + (2 * 3) - 1`.
2. `(^) 10 $ 1 + 1 == (^) 10 (1 + 1)`.
3. `2 ^ 2 * 4 ^ 5 + 1 == ((2 ^ 2) * (4 ^ 5)) + 1`.

## Equivalent expressions

1. `1 + 1 ==  2`
2. `10 ^ 2 == 10 + 9 * 10`
3. `400 - 37 /= (-) 37 400`
4. ``100 `div` 3`` is not the same as `100 / 3`. `div` is integral division. `/` is fractional division.
5. `2 * 5 + 18 /= 2 * (5 + 18)`

## More fun with functions

```haskell
-- #1
let z = 7
let y = z + 8
let x = y ^ 2
let waxOn = x * 5

10 + waxOn
-- gives 1135
(+10) waxOn
-- gives 1135
(-) 15 waxOn
-- gives -1110
(-) waxOn 15
--gives 1110

```

```haskell
-- #2
let z = 7
let y = z + 8
let x = y ^ 2
let waxOn = x * 5
let triple x = x * 3
```

```haskell
-- #3
triple waxOn
-- gives 3375
```

```haskell
-- #4
waxOn = x * 5
  where x = y ^ 2
        y = z + 8
        z = 7
```

```haskell
-- #5
waxOn = x * 5
  where x = y ^ 2
        y = z + 8
        z = 7

triple x = x * 3
```

```haskell
-- #6
waxOn = x * 5
  where x = y ^ 2
        y = z + 8
        z = 7

triple x = x * 3

waxOff x = triple x

-- waxOff waxOn gives 3375
-- waxOff 10 gives 30
-- waxOff (-50) gives -150
```
