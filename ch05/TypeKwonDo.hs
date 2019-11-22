module TypeKwonDo where

-- Type-Kwon-Do

data Woot
data Blah

f :: Woot -> Blah
f = undefined

g :: (Blah, Woot) -> (Blah, Blah)
g (b, w) = (b, f w)


-- 1. This is a composition `h x = g (f x)`.
f' :: Int -> String
f' = undefined

g' :: String -> Char
g' = undefined

h' :: Int -> Char
h' = g' . f'

-- 2. This is also a composition `e a = w (q a)`.
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e = w . q


-- 3. This accepts inputs `x` and `y` and uses the function `xz` and `yz`.
data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y)

-- 4. This is another composition `munge f g x = fst (g (f x))`
munge :: (x -> y)
      -> (y -> (w, z))
      -> x
      -> w
munge f g =  fst . g . f
