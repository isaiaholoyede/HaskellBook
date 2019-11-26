module ApplyTimes where

-- Intermission: Exercise

applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 _ b = b
applyTimes n f b = f (applyTimes (n - 1) f b)

-- Write out the evaluation of
-- applyTimes 5 (+1) 5
-- (+1) (applyTimes 4 (+1) 5)
-- (+1) ((+1) (applyTimes 3 (+1) 5))
-- (+1) ((+1) ((+1) (applyTimes 2 (+1) 5)))
-- (+1) ((+1) ((+1) ((+1) (applyTimes 1 (+1) 5))))
-- (+1) ((+1) ((+1) ((+1) ((+1) (applyTimes 0 (+1) 5)))))
-- (+1) ((+1) ((+1) ((+1) ((+1) 5))))
-- (+1) ((+1) ((+1) ((+1) 6)))
-- (+1) ((+1) ((+1) 7))
-- (+1) ((+1) 8)
-- (+1) 9
-- 10
