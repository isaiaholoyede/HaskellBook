module DoesItTypecheck where

-- #1
-- data Person = Person Bool

-- printPerson :: Person -> IO()
-- printPerson person = putStrLn (show person)
-- This will not typecheck
-- There is no instance for Show typeclass defined for the Person datatype.  

data Person = Person Bool deriving Show

printPerson :: Person -> IO()
printPerson person = putStrLn (show person)

-- #2
-- data Mood = Blah | Woot deriving Show

-- settleDown x = if x == Woot then Blah else x
-- This will not typecheck
-- There is no instance for Eq typeclass defined for the Mood datatype

data Mood = Blah | Woot deriving (Show, Eq, Ord)

settleDown x = if x == Woot then Blah else x

-- #3
-- a) The values that are acceptable inputs to the function settleDown are Blah and Woot.
-- b) If you try to run settleDown 9, it will throw an error because
--    there is no instance for Num typeclass defined for the Mood datatype
-- c) Running Blah > Woot will throw an error because there is no instance f
--    or Ord typeclass defined for the Mood datatype.

-- #4
type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object
  deriving (Eq, Show)

s1 :: Object -> Sentence
s1 = Sentence "dogs" "drool"

s2 :: Object -> Sentence
s2 = Sentence "Julie" "loves" "dogs"

-- This typechecks.
-- s1 :: Object -> Sentence.
-- Applying S1 to a string (object) will result in a fully evaluated Sentence.
-- s2 :: Sentence

data Rocks = Rocks String deriving (Eq, Ord, Show)
data Yeah = Yeah Bool deriving (Eq, Ord, Show)
data Papu = Papu Rocks Yeah deriving (Eq, Ord, Show)

-- #1
-- phew = Papu "chases" True
-- This will not typecheck.
-- The datatype Papu must use the datatype definitions for Rocks and Yeah.
phew = Papu (Rocks "chases") (Yeah True)

-- #2
-- This typechecks.
truth = Papu (Rocks "chomskydoz") (Yeah True)

-- #3
-- This typechecks.
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

-- #4
-- This will not typecheck without first deriving the Ord typeclasses
-- for the various data types.
comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'
