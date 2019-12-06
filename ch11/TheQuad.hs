module TheQuad where
-- Exercises: The Quad

data Quad =
    One
  | Two
  | Three
  | Four
  deriving (Eq, Show)

-- 1. eQuad takes 8 forms.
-- Question #1
eQuad :: Either Quad Quad
eQuad = undefined

-- eQuad takes 4 + 4 = 8

-- 2. prodQuad takes 16 forms.
-- Question #2
prodQuad :: (Quad, Quad)
prodQuad = undefined

-- prodQuad takes 4 * 4 = 16

-- 3. funcQuad takes 256 forms.
-- Question #3
funcQuad :: Quad -> Quad
funcQuad = undefined

-- funcQuad takes 4^4 = 256

--4. prodTBool takes 8 forms.
-- Question #4
prodTBool :: (Bool, Bool, Bool)
prodTBool = undefined
-- prodTBool takes 2 * 2 * 2 = 8

-- 5. gTwo takes 16 forms.
-- Question #5
gTwo :: Bool -> Bool -> Bool
gTwo = undefined

-- gTwo takes (2^2)^2) = 2^(2 * 2) = 16

-- 6. fTwo takes 65,536 forms.
-- Question #6
fTwo :: Bool -> Quad -> Quad
fTwo = undefined

-- fTwo takes (4 ^ 4 ^ 2) = 4 ^ (4 * 2) = 65,536
