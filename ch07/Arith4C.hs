-- #6
-- arith4.hs
module Arith4C where

-- type signature changed
roundTrip :: (Show a, Read b) => a -> b
roundTrip = read  . show

main :: IO()
main = do
    -- type assertion done here.
    print ((roundTrip 4) :: Int)
    print (id 4)
    