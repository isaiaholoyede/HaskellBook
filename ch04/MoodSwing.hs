-- Exercises: Mood Swing
module MoodSwing where

data Mood = Blah | Woot deriving Show
-- #1
-- The type constructor is Mood.

-- #2
-- If the function requires a Mood value, we can only use Blah or Woot.

-- #3
-- What is wrong with changeMood :: Mood -> Woot is that Woot is not a type constructor. It is a data constructor. A data constructor cannot appear in the type signature, it can only appear at the term level.

-- #4
-- Mood should not appear at the term level since it is a type constructor.
-- Fixed function is shown below.

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood    _ = Blah

-- #5
-- This whole code can be run as a script.
