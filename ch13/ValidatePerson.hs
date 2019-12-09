module ValidatePerson where

import System.IO
import Control.Monad (forever)
import System.Exit (exitSuccess)
import Data.Char (toLower)

-- Exercise 4
type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid =
    NameEmpty
  | AgeTooLow
  | PersonInvalidUnknown String
  deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 =
      Right $ Person name age
  | name == "" = Left NameEmpty
  | age <= 0 = Left AgeTooLow
  | otherwise =
      Left $ PersonInvalidUnknown $
        "Name was: " ++ show name ++
        "Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
  hSetBuffering stdout NoBuffering
  putStr "Please enter your name: "
  name <- getLine
  putStr "Please enter your age: "
  age <- getLine
  case mkPerson name (read age) of
    Right (Person name age) ->
      putStrLn $ "Yay! Successfully got a person: "
                ++ show (Person name age)
    Left error ->
      putStrLn $ "Error occurred: " ++ show error
