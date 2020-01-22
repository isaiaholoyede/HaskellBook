module FixerUpper where

-- #1
a = const <$> Just "Hello" <*> pure "World"

-- #2
b = (,,,) <$> Just 90 
    <*> Just 10 
    <*> Just "Tierness" 
    <*> pure [1, 2, 3]