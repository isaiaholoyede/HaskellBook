module Arith2 where

add :: Int -> Int -> Int
add x y = x + y

addPF :: Int -> Int -> Int
addPF = (+)

addOne :: Int -> Int
addOne = \x -> x + 1

addOnePF :: Int -> Int
addOnePF = (+1)

main :: IO()
main = do
  print (0 :: Int) -- returns 0
  print (add 1 0) -- returns 1
  print (addOne 0) -- returns 1
  print (addOnePF 0) -- returns 1
  print ((addOne . addOne) 0) -- returns 2
  print ((addOnePF . addOne) 0) -- returns 2
  print ((addOne . addOnePF) 0) -- returns 2
  print ((addOnePF . addOnePF) 0) -- returns 2
  print (negate (addOne 0)) -- returns -1
  print ((negate . addOne) 0) -- returns -1
  print ((addOne . addOne . addOne
          . negate . addOne) 0) -- returns 2
     