module SafeHead where
-- This is my attempt at rewriting myHead function using Maybe.

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x
