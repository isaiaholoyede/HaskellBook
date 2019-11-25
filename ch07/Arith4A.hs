-- #4
-- source code to be loaded
-- arith4.hs
module Arith4A where

-- id :: a -> a
-- id x = x

roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read  (show a)

main :: IO()
main = do
    print (roundTrip 4)
    print (id 4)
    