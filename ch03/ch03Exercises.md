# Chapter Exercises

## Reading Syntax

a. `concat [[1, 2, 3], [4, 5, 6]]` is written correctly. The result is `[1,2,3,4,5,6]`
b. `++ [1,2,3] [4,5,6]`is not written correctly. The `++` should be `(++)`. The result of `(++) [1,2,3] [4,5,6]` is `[1,2,3,4,5,6]`.
c. `(++) "hello" " world"` is written correctly. The result is "hello world".
d. `["hello" ++ " world]` is not written correctly. `" world` should be `" world"`. The result of `["hello" ++ " world"]` is `["hello world"]`.
e. `4 !! "hello"` is not written correctly. `4 !! "hello"` should be `"hello" !! 4`. The result of `"hello" !! 4` is `o`.
f. `(!!) "hello" 4` is written correctly. The result of `(!!) "hello" 4` is `o`.
g. `take "4 lovely"` is not written correctly. `take "4 lovely"` should be `take 4 "lovely"`. The result of `take 4 "lovely"` is `"love"`.
h. `take 3 "awesome"` is written correctly. The result of `take 3 "awesome"` is `"awe"`.

## Result Matching

```haskell
-- a) concat [[1 * 6],[2 * 6], [3 * 6]]
concat [[1 * 6],[2 * 6],[3 * 6]]
-- result is [6, 12, 18]
-- option d)
```

```haskell
-- b) "rain" ++ drop 2 "elbow"
"rain" ++ drop 2 "elbow"
-- result is "rainbow"
-- option c)
```

```haskell
-- c) 10 * head [1,2,3]
10 * head [1,2,3]
-- result is 10
-- option e)
```

```haskell
-- d) (take 3 "Julie") ++ (tail "yes")
(take 3 "Julie") ++ (tail "yes")
-- result is "Jules"
-- option a)
```

```haskell
-- e) concat [tail [1, 2, 3], tail [4, 5, 6], tail [7, 8, 9]]
concat [tail [1, 2, 3],
        tail [4, 5, 6],
        tail [7, 8, 9]]
-- result is [2,3,5,6,8,9]
-- option b)
```

## Building functions

```haskell
-- #1
-- a)
"Curry is awesome" ++ "!"

-- b)
take 1 $ drop 4 $ "Curry is awesome" ++ "!"

-- c)
drop 9 $ "Curry is awesome" ++ "!"
```
