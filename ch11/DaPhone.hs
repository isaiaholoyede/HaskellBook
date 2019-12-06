module DaPhone where

import Data.Char
import Data.List
import Data.Ord

-- Question #1
-- fill in the rest
data DaPhone = DaPhone [(Char, String)]

myPhone :: DaPhone
myPhone = DaPhone [  ('1', "1")
                   , ('2', "abc2")
                   , ('3', "def3")
                   , ('4', "ghi4")
                   , ('5', "jkl5")
                   , ('6', "mno6")
                   , ('7', "pqrs7")
                   , ('8', "tuv8")
                   , ('9', "wxyz9")
                   , ('*', "^*")
                   , ('0', " +_0")
                   , ('#', ".,#")]

-- Question #2
-- Convert convo into key presses
convo :: [String]
convo = ["Wanna play 20 questions",
        "Ya",
        "U 1st haha",
        "Lol ok. Have u ever tasted alcohol lol",
        "Lol ya",
        "Wow ur cool haha. Ur turn",
        "Ok. Do u think I am pretty Lol",
        "Lol ya",
        "Haha thanks just making sure rofl ur turn"]

-- validButtons = '1234567890*#'
type Digit = Char

-- Valid Presses: 1 and up
type Presses = Int

scanKey :: DaPhone -> Char -> (Digit, Presses)
scanKey (DaPhone ((digit, press):xs)) c =
  case elemIndex c press of
    Just index -> (digit, index + 1)
    Nothing -> scanKey (DaPhone xs) c

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps phone c
  | isUpper c = [('*', 1), scanKey phone (toLower c)]
  | otherwise = [scanKey phone c]

-- assuming the default phone definition
-- 'a' -> [('2', 1)]
-- 'A' -> [('*', 1), ('2', 1)]

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
-- cellPhonesDead phone msg = concat (map (reverseTaps phone) msg)
-- cellPhonesDead phone msg = concat ((map . reverseTaps $ phone) msg)
-- cellPhonesDead phone = concat . (map . reverseTaps $ phone)
-- cellPhonesDead phone = (concat . ) . map . reverseTaps $ phone
-- cellPhonesDead  = (concat .) . map . reverseTaps
cellPhonesDead  = foldMap . reverseTaps

-- Question #3
fingerTaps :: [(Digit, Presses)] -> Presses
-- fingerTaps [] = 0
-- fingerTaps ((_, p):xs) = p + fingerTaps xs
-- fingerTaps xs = sum $ map snd xs
fingerTaps = sum . map snd

-- Question #4
mostPopularLetter :: String -> Char
mostPopularLetter = mostOccuring

tapCost :: DaPhone -> Digit -> Presses
tapCost phone = fingerTaps . reverseTaps phone

-- Question #5
coolestLtr :: [String] -> Char
coolestLtr = mostPopularLetter . filter isAlpha . concat

coolestWord :: [String] -> String
coolestWord = mostOccuring . words . unwords

mostOccuring :: Ord a => [a] -> a
mostOccuring = snd . maximumBy (comparing fst) .
  map (\x -> (length x, head x)) . group . sort
