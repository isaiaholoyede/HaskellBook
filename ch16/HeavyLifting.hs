module HeavyLifting where

-- #1
a :: [Int]
a = fmap (+1) $ read "[1]" :: [Int]

-- #2
b :: Maybe [String]
b = (fmap . fmap) (++ "lol") (Just ["Hi,", "Hello"])

-- #3
c :: Num a => a -> a
c = fmap (*2) (\x -> x - 2)

-- #4
d :: Integer -> String
d = fmap ((return '1' ++) . show) (\x -> [x, 1..3])

-- #5
e :: IO Integer
e = let ioi = readIO "1" :: IO Integer
        changed = fmap read $ fmap ("123" ++) $ fmap show ioi
    in fmap (*3) changed
