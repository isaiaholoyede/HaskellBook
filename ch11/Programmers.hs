module Programmers where
-- Exercise: Programmers

data OperatingSystem =
    GnuPlusLinux
  | OpenBSDPlusNeverMindJustBSDStill
  | Mac
  | Windows
  deriving (Eq, Show)

data ProgrammingLanguage =
    Haskell
  | Agda
  | Idris
  | PureScript
  deriving (Eq, Show)

data Programmer =
  Programmer {  os :: OperatingSystem
              , lang :: ProgrammingLanguage}
  deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
  [  GnuPlusLinux
   , OpenBSDPlusNeverMindJustBSDStill
   , Mac
   , Windows]

allLanguages :: [ProgrammingLanguage]
allLanguages = [Haskell, Agda, Idris, PureScript]

-- A function that generates all possible values of Programmers
-- using the provided lists of inhabitants
-- of OperatingSystem and ProgrammingLanguage
allProgrammers :: [Programmer]
allProgrammers = [Programmer {os = x, lang = y}
  | x <- allOperatingSystems, y <- allLanguages]

-- # of inhabitants
-- Both numberProgrammers and numberProgrammers' are equal
numberProgrammers :: Int
numberProgrammers = length allProgrammers

numberProgrammers' :: Int
numberProgrammers' = length allOperatingSystems * length allLanguages
