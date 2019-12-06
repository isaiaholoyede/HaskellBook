module PityTheBool where

import Data.Int

-- Exercises: Pity the Bool

data BigSmall = Big Bool | Small Bool
  deriving (Eq, Show)


-- 1. The cardinality of this datatype is four.
--  Big Bool | Small Bool == ??
--  Big (True | False) | Small (True | False) == ??
--  Big 2 | Small 2 == ??
-- 2 + 2 == 4

-- 2. NumberOrBool

    -- {-# LANGUAGE NegativeLiterals #-}

data NumberOrBool =
    Numba Int8
  | BoolyBool Bool
  deriving (Eq, Show)

-- The cardinality of NumberOrBool is `256 + 2` = `258`.
-- creating a `Numba` with a numeric literal larger than `127` 
-- e.g. `200` gives a warning or with a numeric literal smaller than `(-128)` e.g. `-200`
