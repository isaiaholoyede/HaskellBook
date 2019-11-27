module PoemLines where

firstSen, secondSen, thirdSen, fourthSen :: String
firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful\
            \ symmetry?"

sentences :: String
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

myTokenizer :: (String -> [String])
                -> Char -> String -> [String]
myTokenizer t c "" = []
myTokenizer t c xs = f xs : (t . h . g) xs
  where f = takeWhile n
        g = dropWhile n
        h = dropWhile s
        n = (/=c)
        s = (==c)

myWords :: String -> [String]
myWords = myTokenizer myWords ' '

myLines :: String -> [String]
myLines = myTokenizer myLines '\n'

shouldEqual :: [String]
shouldEqual =
  [ "Tyger Tyger, burning bright"
     , "In the forests of the night"
     , "What immortal hand or eye"
     , "Could frame thy fearful symmetry?"
     ]

main :: IO ()
main =
  print $
  "Are they equal? "
  ++ show (myLines sentences
           == shouldEqual)
