module Validation where

data Validation a b =
  Failure a | Success b
  deriving (Eq, Show)

instance Semigroup a =>
  Semigroup (Validation a b) where
    (Failure a) <> (Failure b) = Failure (a <> b)
    (Success a) <> _ = Success a
    _ <> (Success a) = Success a

main = do
  let failure :: String
              -> Validation String Int
      failure = Failure
      success :: Int
              -> Validation String Int
      success = Success
  print $ success 1 <> failure "blah"
  print $ failure "woot" <> failure "blah"
  print $ success 1 <> success 2
  print $ failure "woot" <> success 2
