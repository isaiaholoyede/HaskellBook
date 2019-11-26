module MatchTheTypes where
-- Match the types

import Data.List

-- #1
i :: Num a => a
-- i :: a
i = 1
-- i :: a will not typecheck because the literal 1 belongs to the Num typeclass, 
-- hence it is more constrained than the parametric polymorphic type variable a.

-- #2
f :: Float
-- f :: Num a => a
f = 1.0
-- f :: Num a => a will not typecheck 
-- because the lieral 1.0 belongs to the Fractional typeclass, 
-- hence it is more constrained than the Num typeclass.

-- #3
--f :: Float
f' :: Fractional a => a
f' = 1.0
-- f' :: Fractional a => a typechecks 
-- because 1.0 belongs to the Fractional typeclass.

-- #4
-- f :: Float
f'' :: RealFrac a => a
f'' = 1.0
-- RealFrac also works here. 
-- RealFrac is a subclass of Real and Fractional typeclasses.

-- #5
freud :: a -> a
freud x = x

freud' :: Ord a => a -> a
freud' x = x
-- Both typechecks. freud and freud' are identity functions.

-- #6
-- freud :: a -> a
-- freud x = x

freud'' :: Int -> Int
freud'' x = x
-- Both typechecks. freud' only works for integer datatypes.

-- #7
myX :: Int
myX = 1 :: Int

sigmund :: Int -> Int
sigmund _ = myX

-- sigmund :: a -> a
-- sigmund _ = myX
-- sigmund :: a -> a will not typecheck because myX is already constrained to Int. 
-- So, a more general polymorphic type variable will no longer apply.

-- #8
-- myX :: Int
-- myX = 1 :: Int

sigmund' :: Int -> Int
sigmund' _ = myX

-- sigmund' :: Num a => a -> a
-- sigmund' _ = myX
-- sigmund' :: Num a => a -> a will not typecheck because myX is already constrained to Int. 
-- So, a more general polymorphic type variable will no longer apply.

-- #9
jung :: Ord a => [a] -> a
jung xs = head (sort xs)

jung' :: [Int] -> Int
jung' xs = head (sort xs)
-- Both typechecks. Int already implements instance of Ord typeclass 
-- which is required by the sort function.

-- #10
young :: [Char] -> Char
young xs = head (sort xs)

young' :: Ord a => [a] -> a
young' xs = head (sort xs)
-- Both typechecks. Char already implements instance of Ord typeclass 
-- which is required by the sort function.

-- #11
mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (mySort xs)
-- This typechecks.

-- signifier' :: Ord a => [a] -> a
-- signifier' xs = head (mySort xs)
-- This will not typecheck since mySort is already constrained 
-- by the type signature to [Char] -> Char.
