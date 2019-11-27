module FearfulSymmetry where

myWords :: String -> [String]
myWords "" = []
myWords xs = f xs : (myWords . h . g) xs
  where f = takeWhile n
        g = dropWhile n
        h = dropWhile s
        n = (/=' ')
        s = (==' ')
