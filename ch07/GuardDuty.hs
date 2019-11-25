module GuardDuty where

avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
  | y >= 0.9  = 'A'
  | y >= 0.8  = 'B'
  | y >= 0.7  = 'C'
  | y >= 0.59 = 'D'
  | otherwise = 'F'
  where y = x / 100

pal :: Eq a => [a] -> Bool
pal xs
     | xs == reverse xs = True
     | otherwise        = False

numbers :: (Num a, Ord a) => a -> a
numbers x
    | x < 0  = -1
    | x == 0 = 0
    | x > 0  = 1

-- 1. If we put `| otherwise = F` as our top-most guard,, 
-- then passing a `90` as an argument or any value at all will return a `F`.

-- 2. If we reorder the guards, it typechecks, but it does not work the same. 
-- Moving `| y >= 0.7 = 'C'` as the top-most guard and passing it the argument `90`, 
-- which should be `A` now returns `C` instead of `A`.

-- 3. `pal xs` returns b) `True` when `xs` is a palindrome.

-- 4. `pal` can take a list of any type.

-- 5. The type of `pal` is `Eq a => [a] -> Bool`.

-- 6. `numbers x` returns c) an indication of 
-- whether its argument is a positive or negative number or zero.

-- 7. `numbers` can only take numeric arguments `(Num a, Ord a) => a`.

-- 8. The type of function `numbers` is `(Num a, Ord a, Num b) => a -> b`.