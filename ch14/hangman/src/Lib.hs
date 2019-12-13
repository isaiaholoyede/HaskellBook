module Lib where

import Control.Monad (forever)
import Data.Char (toLower)
import Data.Maybe (isJust)
import Data.List (intersperse)
import System.Exit (exitSuccess)
import System.Random (randomRIO)

newtype WordList = WordList [String] deriving (Eq, Show)

data Puzzle = Puzzle String [Maybe Char] String Int

allWords :: IO WordList
allWords = do
  dict <- readFile "data/dict.txt"
  return $ WordList (lines dict)

minWordLength :: Int
minWordLength = 5

maxWordLength :: Int
maxWordLength = 9

gameWords :: IO WordList
gameWords = do
  (WordList aw) <- allWords
  return $ WordList (filter gamelength aw)
  where gamelength w =
          let l = length (w :: String)
          in  l >= minWordLength
             && l < maxWordLength

randomWord :: WordList -> IO String
randomWord (WordList wl) = do
  randomIndex <- randomRIO (0, (length wl) - 1)
  return $ wl !! randomIndex

randomWord' :: IO String
randomWord' = gameWords >>= randomWord

instance Show Puzzle where
  show (Puzzle _ discovered guessed wrong) =
    (intersperse ' ' $ fmap renderPuzzleChar discovered)
    ++ " Guessed so far: " ++ guessed
    ++ " Wrong Guesses: " ++ show wrong

freshPuzzle :: String -> Puzzle
freshPuzzle xs = Puzzle xs (fmap (const Nothing) xs) "" 0

charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle xs _ _ _) c = elem c xs

alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ _ zs _) c = elem c zs

countWrong :: Puzzle -> Puzzle
countWrong (Puzzle xs ys zs n) = Puzzle xs ys zs (succ n)

renderPuzzleChar :: Maybe Char -> Char
renderPuzzleChar Nothing = '_'
renderPuzzleChar (Just c) = c

fillInCharacter :: Puzzle -> Char -> Puzzle
fillInCharacter (Puzzle word filledInSoFar s wrong) c =
  Puzzle word newFilledInSoFar (c : s) wrong
  where zipper guessed wordChar guessChar =
          if wordChar == guessed
          then Just wordChar
          else guessChar
        newFilledInSoFar =
          zipWith (zipper c) word filledInSoFar

handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
  putStrLn $ "Your guess was: " ++ [guess]
  case (charInWord puzzle guess, alreadyGuessed puzzle guess) of
    (_, True) -> do
      putStrLn "You already guessed that\
                \ character, pick \
                \ something else!"
      return puzzle
    (True, _) -> do
      putStrLn "This character was in the\
                \ word, filling in the word\
                \ accordiningly."
      return (fillInCharacter puzzle guess)
    (False, _) -> do
      putStrLn "This character wasn't in\
               \ the word, try again."
      return (fillInCharacter (countWrong puzzle) guess)

gameOver :: Puzzle -> IO ()
gameOver (Puzzle wordToGuess _ guessed wrong) =
  if wrong > 7 then
    do putStrLn "You lose!"
       putStrLn $
         "The word was: " ++ wordToGuess
       exitSuccess
  else return ()

gameWin :: Puzzle -> IO ()
gameWin (Puzzle _ filledInSoFar _ _) =
  if all isJust filledInSoFar then
    do putStrLn "You win!"
       exitSuccess
  else return ()

runGame :: Puzzle -> IO ()
runGame puzzle = forever $ do
  gameOver puzzle
  gameWin puzzle
  putStrLn $
    "Current puzzle is: " ++ show puzzle
  putStr "guess a letter: "
  guess <- getLine
  case guess of
    [c] -> handleGuess puzzle c >>= runGame
    _   -> putStrLn "Your guess must\
                     \ be a single character"
