module ArtfulDodgy where

-- Exercises: Artful Dodgy

dodgy :: Num a => a -> a -> a
dodgy x y = x + y * 10

oneIsOne :: Num a => a -> a
oneIsOne = dodgy 1

oneIsTwo :: Num a => a -> a
oneIsTwo = (flip dodgy) 2

-- 1. `dodgy 1 0` gives `1`.
-- 2. `dodgy 1 1` gives `11`.
-- 3. `dodgy 2 2` gives `22`.
-- 4. `dodgy 1 2` gives `21`.
-- 5. `dodgy 2 1` gives `12`.
-- 6. `oneIsOne 1` gives `11`.
-- 7. `oneIsOne 2` gives `21`.
-- 8. `oneIsTwo 1` gives `21`.
-- 9. `oneIsTwo 2` gives `22`.
-- 10. `oneIsOne 3` gives `31`.
-- 11. `oneIsTwo 3` gives `23`.