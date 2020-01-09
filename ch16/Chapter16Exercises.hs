{-# LANGUAGE FlexibleInstances #-}

module Chapter16Exercises where

import GHC.Arr

-- #1. Bool
data Bool = False | True
-- A valid Functor cannot be written for the data type
-- Functor requires a type constructor with * -> * kind
-- Bool has a kind of *

-- #2. BoolAndSomethingElse
data BoolAndSomethingElse a =
  False' a | True' a
  deriving (Eq, Show)

instance Functor BoolAndSomethingElse where
  fmap f (False' x) = False' (f x)
  fmap f (True' x)  = True' (f x)

-- #3. BoolAndMaybeSomethingElse
data BoolAndMaybeSomethingElse a =
  Falsish | Truish a
  deriving (Eq, Show)

instance Functor BoolAndMaybeSomethingElse where
  fmap _ Falsish    = Falsish
  fmap f (Truish x) = Truish (f x)


-- #4. Mu
newtype Mu f = Inf {outF :: f (Mu f)}
-- The kind of Mu is (* -> *) -> *
-- Creating a Functor instance is not possible

-- #5. data D
data D = D (Array Word Word) Int Int
  deriving (Eq, Show)
  -- The kind for D is *
  -- Creating a Functor instance is not possible.

-- Rearranging the Arguments to the Type Constructor
-- #1. Sum
data Sum b a =
    First a
  | Second b

instance Functor (Sum e) where
  fmap f (First a)  = First (f a)
  fmap f (Second b) = Second b

-- #2. Company
data Company a c b =
    DeepBlue a c
  | Something b

instance Functor (Company e e') where
  fmap f (Something b)  = Something (f b)
  fmap _ (DeepBlue a c) = DeepBlue a c

-- #3. More
data More b a =
    L a b a
  | R b a b
  deriving (Eq, Show)

instance Functor (More x) where
  fmap f (L a b a') = L (f a) b (f a')
  fmap f (R b a b') = R b (f a) b'

-- Write Functor Instances
-- #1. Quant
data Quant a b =
    Finance
  | Desk a
  | Bloor b
  deriving (Eq, Show)

instance Functor (Quant a) where
  fmap _ Finance   = Finance
  fmap _ (Desk x)  = Desk x
  fmap f (Bloor x) = Bloor (f x)

-- #2. K
data K a b = K a

instance Functor (K a) where
  fmap _ (K x) = K x

-- #3. Flip
newtype Flip f a b =
  Flip (f b a)
  deriving (Eq, Show)

newtype K' a b = K' a

instance Functor (Flip K' a) where
  fmap f (Flip (K' a)) = Flip (K' (f a))

-- #4. EvilGoateeConst
data EvilGoateeConst a b = GoatyConst b

instance Functor (EvilGoateeConst a) where
  fmap f (GoatyConst b) = GoatyConst (f b)

-- #5. LiftItOut
data LiftItOut f a = LiftItOut (f a)

instance Functor e => Functor (LiftItOut e) where
  fmap f (LiftItOut fa) = LiftItOut (fmap f fa)

-- #6. Parappa
data Parappa f g a = DaWrappa (f a) (g a)

instance (Functor f, Functor g)
  => Functor (Parappa f g) where
    fmap f' (DaWrappa fa ga)
      = DaWrappa (fmap f' fa) (fmap f' ga)

-- #7. IgnoreOne
data IgnoreOne f g a b =
  IgnoringSomething (f a) (g b)

instance Functor g
  => Functor (IgnoreOne f g a) where
    fmap f' (IgnoringSomething fa gb) =
      IgnoringSomething fa (fmap f' gb)

-- #8. Notorious
data Notorious g o a t =
  Notorious (g o) (g a) (g t)

instance Functor g => Functor (Notorious g o a) where
  fmap f (Notorious x y z) = Notorious x y (fmap f z)

-- #9. List
data List a =
    Nil
  | Cons a (List a)
  deriving Show

instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x y) = Cons (f x) (fmap f y)

-- #10. GoatLoad
data GoatLord a =
    NoGoat
  | OneGoat a
  | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)

instance Functor GoatLord where
  fmap _ NoGoat      = NoGoat
  fmap f (OneGoat x) = OneGoat (f x)
  fmap f (MoreGoats x y z) =
    MoreGoats (fmap f x) (fmap f y) (fmap f z)

-- #11. TalkToMe
data TalkToMe a =
    Halt
  | Print String a
  | Read (String -> a)

instance Functor TalkToMe where
  fmap _ Halt = Halt
  fmap f (Print xs y) = Print xs (f y)
  fmap f (Read g) = Read (fmap f g)
