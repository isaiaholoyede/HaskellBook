module RewriteWithWhere where

-- #1
evalStuff :: Num a => a
evalStuff = x * 3 + y
  where x = 3
        y = 1000

-- #2
evalNum :: Num a => a
evalNum = x * 5
  where x = 10 * 5 + y
        y = 10

-- #3
evalMore :: Fractional a => a
evalMore = z / x + y
  where x = 7
        y = negate x
        z = y * 10