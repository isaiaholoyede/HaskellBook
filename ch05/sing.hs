module Sing where

fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbdow"

sing :: [Char] -> [Char] -> [Char]
sing x y = if (x > y) then fstString x else sndString y
         where x = "Singin"
               y = "Somewhere"
