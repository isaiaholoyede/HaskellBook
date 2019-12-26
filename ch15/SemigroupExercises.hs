module SemigroupExercises where

import Data.Semigroup as S
import Data.Monoid as M
import Test.QuickCheck

-- #1. Trivial
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
  Trivial <> Trivial = Trivial

instance Arbitrary Trivial where
  arbitrary = return Trivial

semigroupAssoc :: (Eq m, Semigroup m)
               => m -> m -> m -> Bool
semigroupAssoc a b c =
  (a <> (b <> c)) == ((a <> b) <> c)

type TrivAssoc =
  Trivial -> Trivial -> Trivial -> Bool

-- #2. Identity a
newtype Identity a = Identity a
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
  (<>) (Identity a) (Identity a') = Identity (a <> a')

identityGen :: Arbitrary a => Gen (Identity a)
identityGen = Identity <$> arbitrary
-- identityGen = do
--   a <- arbitrary
--   return (Identity a)

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = identityGen

type IdentityAssoc = Identity String -> Identity String
  -> Identity String -> Bool

-- #3. Two a b
data Two a b = Two a b
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
  (<>) (Two a b) (Two a' b') = Two (a <> a') (b <> b')

twoGen :: (Arbitrary a, Arbitrary b) => Gen (Two a b)
twoGen = do
  a <- arbitrary
  b <- arbitrary
  return (Two a b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = twoGen

type TwoAssoc = Two String (Sum Int) -> Two String (Sum Int)
  -> Two String (Sum Int) -> Bool

-- #4. Three a b c
data Three a b c = Three a b c
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c)
  => Semigroup (Three a b c) where
    (<>) (Three a b c) (Three a' b' c') =
         Three (a <> a') (b <> b') (c <> c')

threeGen :: (Arbitrary a, Arbitrary b, Arbitrary c)
  => Gen (Three a b c)
threeGen = do
  a <- arbitrary
  b <- arbitrary
  c <- arbitrary
  return (Three a b c)

instance (Arbitrary a, Arbitrary b, Arbitrary c)
  => Arbitrary (Three a b c) where
    arbitrary = threeGen

type ThreeAssoc = Three String (Sum Int) (Product Int)
   -> Three String (Sum Int) (Product Int)
   -> Three String (Sum Int) (Product Int)
   -> Bool

-- #5. Four a b c d
data Four a b c d = Four a b c d
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d)
  => Semigroup (Four a b c d) where
    (<>) (Four a b c d) (Four a' b' c' d')
       = Four (a <> a') (b <> b') (c <> c') (d <> d')

fourGen :: (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d)
  => Gen (Four a b c d)
fourGen = do
  a <- arbitrary
  b <- arbitrary
  c <- arbitrary
  d <- arbitrary
  return (Four a b c d)

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d)
  => Arbitrary (Four a b c d) where
    arbitrary = fourGen

type FourAssoc =
      Four String (Sum Int) (Product Int) String
   -> Four String (Sum Int) (Product Int) String
   -> Four String (Sum Int) (Product Int) String
   -> Bool

-- #6. BoolConj
newtype BoolConj = BoolConj Bool
  deriving (Eq, Show)

instance Semigroup BoolConj where
  (<>) (BoolConj True) (BoolConj True) =
        BoolConj True
  (<>) (BoolConj _) (BoolConj _) =
        BoolConj False

boolConjGen :: Gen BoolConj
boolConjGen = BoolConj <$> arbitrary
-- boolConjGen = do
--   a <- arbitrary
--   return (BoolConj a)

instance Arbitrary BoolConj where
  arbitrary = boolConjGen

type BoolConjAssoc =
    BoolConj -> BoolConj -> BoolConj -> Bool

-- #7. BoolDisj
newtype BoolDisj = BoolDisj Bool
  deriving (Eq, Show)

instance Semigroup BoolDisj where
  (<>) (BoolDisj False) (BoolDisj False) = 
    BoolDisj False
  (<>) (BoolDisj _) (BoolDisj _) = 
    BoolDisj True

boolDisjGen :: Gen BoolDisj
boolDisjGen = BoolDisj <$> arbitrary
-- boolDisjGen = do
--   a <- arbitrary
--   return $ BoolDisj a

instance Arbitrary BoolDisj where
  arbitrary = boolDisjGen

type BoolDisjAssoc =
    BoolDisj -> BoolDisj -> BoolDisj -> Bool

-- #8. Or a b
data Or a b =
    Fst a
  | Snd b
  deriving (Eq, Show)

instance Semigroup (Or a b) where
    (<>) (Snd b) _ = Snd b
    (<>) _ (Snd b) = Snd b
    (<>) _ (Fst a) = Fst a

orGen :: (Arbitrary a, Arbitrary b) => Gen (Or a b)
orGen = do
  a <- arbitrary
  b <- arbitrary
  oneof [return $ Fst a,
         return $ Snd b]

instance (Arbitrary a, Arbitrary b)
  => Arbitrary (Or a b) where
    arbitrary = orGen

type OrAssoc =
       Or Int String
    -> Or Int String
    -> Or Int String
    -> Bool

-- #9. Combine a b
newtype Combine a b =
  Combine { unCombine :: a -> b }

instance Semigroup b => Semigroup (Combine a b) where
     (Combine f) <> (Combine f') = Combine (f <> f')

combineGen :: (CoArbitrary a, Arbitrary b) => Gen (Combine a b)
combineGen = Combine <$> arbitrary
-- combineGen = do
--   f <- arbitrary
--   return $ Combine f

instance (CoArbitrary a, Arbitrary b) => Arbitrary (Combine a b) where
  arbitrary = combineGen

instance (CoArbitrary b, Arbitrary a) => CoArbitrary (Combine a b) where
  coarbitrary (Combine f) = variant 0 . coarbitrary f

funEq :: (Arbitrary a, Show a, Eq b, Show b) => Combine a b -> Combine a b -> Property
funEq (Combine f) (Combine f') = property $ \a -> f a === f' a

instance (Show a, Show b) => Show (Combine a b) where
  show (Combine _) = show "Function Combine a -> b"

type CombineAssoc a b = Combine a b -> Combine a b -> Combine a b -> Property

combineAssoc :: (Arbitrary a, Show a, Eq b, Show b, Semigroup b) => CombineAssoc a b
combineAssoc f g h = ((f <> g) <> h) `funEq` (f <> (g <> h))

-- #10. Comp a
newtype Comp a =
  Comp { unComp :: a -> a }

instance Semigroup a
  => Semigroup (Comp a) where
     (Comp f) <> (Comp f') = Comp (f <> f')

compGen :: (CoArbitrary a, Arbitrary a) => Gen (Comp a)
compGen = Comp <$> arbitrary
-- compGen = do
--   f <- arbitrary
--   return $ Comp f

instance (CoArbitrary a, Arbitrary a) => Arbitrary (Comp a) where
  arbitrary = compGen

instance (CoArbitrary a, Arbitrary a) => CoArbitrary (Comp a) where
  coarbitrary (Comp f) = variant 0 . coarbitrary f

funEq' :: (Arbitrary a, Show a, Eq a, Show a) => Comp a -> Comp a -> Property
funEq' (Comp f) (Comp f') = property $ \a -> f a === f' a

instance Show (Comp a) where
  show (Comp _) = show "Function Comp a -> a"

type CompAssoc a = Comp a -> Comp a -> Comp a -> Property

compAssoc :: (Arbitrary a, Show a, Eq a, Show a, Semigroup a) => CompAssoc a
compAssoc f g h = ((f <> g) <> h) `funEq'` (f <> (g <> h))

main :: IO ()
main = do
  putStrLn "\nTest Trivial Association"
  quickCheck (semigroupAssoc :: TrivAssoc)
  putStrLn "\nTest Identity Association"
  quickCheck (semigroupAssoc :: IdentityAssoc)
  putStrLn "\nTest Two Association"
  quickCheck (semigroupAssoc :: TwoAssoc)
  putStrLn "\nTest Three Association"
  quickCheck (semigroupAssoc :: ThreeAssoc)
  putStrLn "\nTest Four Association"
  quickCheck (semigroupAssoc :: FourAssoc)
  putStrLn "\nTest BoolConj Association"
  quickCheck (semigroupAssoc :: BoolConjAssoc)
  putStrLn "\nTest BoolDisj Association"
  quickCheck (semigroupAssoc :: BoolDisjAssoc)
  putStrLn "\nTest Or Association"
  quickCheck (semigroupAssoc :: OrAssoc)
  putStrLn "\nTest Combine Association"
  quickCheck (combineAssoc :: CombineAssoc (Sum Int) (Sum Int))
  putStrLn "\nTest Comp Association"
  quickCheck (compAssoc :: CompAssoc (Sum Int))
