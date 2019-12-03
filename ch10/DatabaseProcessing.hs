module DatabaseProcessing where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [DbDate (UTCTime (fromGregorian 1911 5 1)
    (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime (fromGregorian 1921 5 1)
      (secondsToDiffTime 34123))
    ]

-- Question 1:
-- Write a function that filters for DbDate values and returns a list of the
-- UTCTime values inside them
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = foldr f []
  where f (DbDate a) b = a : b
        f _ b = b

-- Question 2:
-- Write a function that filters for DbNumber values and returns a list of the
-- Integer values inside them.
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr f []
  where f (DbNumber a) b = a : b
        f _ b = b

-- Question 3:
-- Write a function that gets the most recent date.
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

-- Question 4:
-- Write a function that sums all of the DbNumber values.
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

-- Question 5:
-- Write a function that gets the average of the DbNumber values.
avgDb :: [DatabaseItem] -> Double
avgDb xs = (fromIntegral . sumDb $ xs) /
  (fromIntegral . length . filterDbNumber $ xs)
