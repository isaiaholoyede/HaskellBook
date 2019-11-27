# Exercises: Bottom Madness

## Will it blow up?

```haskell
-- #1
[x^y | x <- [1..5], y <- [2, undefined]]
-- returns a bottom
-- [1,*** Exception: Prelude.undefined

-- #2
take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]
-- returns a value
-- [1]

-- #3
sum [1, undefined, 3]
-- returns a bottom
-- *** Exception: Prelude.undefined

-- #4
length [1, 2, undefined]
-- returns a value
-- 3

-- #5
length $ [1, 2, 3] ++ undefined
-- returns a bottom
-- *** Exception: Prelude.undefined

-- #6
take 1 $ filter even [1, 2, 3, undefined]
-- returns a value
-- [2]

-- #7
take 1 $ filter even [1, 3, undefined]
-- returns a bottom
-- *** Exception: Prelude.undefined

-- #8
take 1 $ filter odd [1, 3, undefined]
-- returns a value
-- [1]

-- #9
take 2 $ filter odd [1, 3, undefined]
-- returns a value
-- [1, 3]

-- #10
take 3 $ filter odd [1, 3, undefined]
-- returns a bottom
--[1,3*** Exception: Prelude.undefined
```

## Intermission: Is it in normal form?

```haskell
-- #1
[1, 2, 3, 4, 5]
-- NF & WHNF - This is fully evaluated list.

-- #2
1 : 2 : 3 : 4 : : _
-- WHNF. The outermost is a data constructor (:)

-- #3
enumFromTo 1 10
-- Neither, this is a function application of enumFromTo

-- #4
length [1, 2, 3, 4, 5]
-- Neither, this is a function application of length

-- #5
sum (enumFromTo 1 10)
-- Neither, this is a function application of sum

-- #6
['a'..'m'] ++ ['n'..'z']
-- Neither, this is a function application of (++)

-- #7
(_, 'b')
-- WHNF. The outermost part is data constructor (,)
```
