module MapThree where
    
-- Exercises: More Bottoms
-- #6

import Data.Bool(bool)

mapThree :: Integral a => [a] -> [a]
mapThree = map (\x -> bool x (-x) (x == 3))
