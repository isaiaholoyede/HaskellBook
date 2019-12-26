module MonoidExercises where

import Data.Semigroup as S
import Data.Monoid as M
import Test.QuickCheck

-- #1. Trivial
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
  Trivial <> Trivial = Trivial

instance Monoid Trivial where
  mempty = Trivial
  mappend = (<>)

instance Arbitrary Trivial where
  arbitrary = return Trivial

semigroupAssoc :: (Eq m, Semigroup m)
               => m -> m -> m -> Bool
semigroupAssoc a b c =
  (a <> (b <> c)) == ((a <> b) <> c)

monoidLeftIdentity :: (Eq m, Monoid m)
                   => m
                   -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity :: (Eq m, Monoid m)
                   => m
                   -> Bool
monoidRightIdentity a = (a <> mempty) == a

type TrivAssoc =
  Trivial -> Trivial -> Trivial -> Bool

type TrivIdentity = Trivial -> Bool

-- #2. Identity a
newtype Identity a = Identity a
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
  (<>) (Identity a) (Identity a') = Identity (a <> a')

instance Monoid a => Monoid (Identity a) where
  mempty = Identity mempty
  mappend = (<>)

identityGen :: Arbitrary a => Gen (Identity a)
identityGen = do
  a <- arbitrary
  return (Identity a)

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = identityGen

type IdentityAssoc = Identity String -> Identity String
  -> Identity String -> Bool

type IdentityIdentity = Identity (Sum Int) -> Bool

-- #3. Two a b
data Two a b = Two a b
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
  (<>) (Two a b) (Two a' b') = Two (a <> a') (b <> b')

instance (Monoid a, Monoid b) => Monoid (Two a b) where
  mempty = Two mempty mempty
  mappend = (<>)

twoGen :: (Arbitrary a, Arbitrary b) => Gen (Two a b)
twoGen = do
  a <- arbitrary
  b <- arbitrary
  return (Two a b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = twoGen

type TwoAssoc = Two String (Sum Int) -> Two String (Sum Int)
  -> Two String (Sum Int) -> Bool

type TwoIdentity = Two String (Sum Int) -> Bool

-- #4. Three a b c
data Three a b c = Three a b c
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c)
  => Semigroup (Three a b c) where
    (<>) (Three a b c) (Three a' b' c') =
         Three (a <> a') (b <> b') (c <> c')

instance (Monoid a, Monoid b, Monoid c)
 => Monoid (Three a b c) where
   mempty = Three mempty mempty mempty
   mappend = (<>)

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

type ThreeIdentity = Three String (Sum Int) (Product Int)
  -> Bool

-- #5. Four a b c d
data Four a b c d = Four a b c d
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d)
  => Semigroup (Four a b c d) where
    (<>) (Four a b c d) (Four a' b' c' d')
       = Four (a <> a') (b <> b') (c <> c') (d <> d')

instance (Monoid a, Monoid b, Monoid c, Monoid d)
 => Monoid (Four a b c d) where
   mempty = Four mempty mempty mempty mempty
   mappend = (<>)

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

type FourIdentity =
     Four String (Sum Int) (Product Int) String
  -> Bool

-- #6. BoolConj
newtype BoolConj = BoolConj Bool
  deriving (Eq, Show)

instance Semigroup BoolConj where
  (<>) (BoolConj True) (BoolConj True) =
        BoolConj True
  (<>) (BoolConj _) (BoolConj _) =
        BoolConj False

instance Monoid BoolConj where
  mempty = BoolConj True
  mappend = (<>)

boolConjGen :: Gen BoolConj
boolConjGen = do
  a <- arbitrary
  return (BoolConj a)

instance Arbitrary BoolConj where
  arbitrary = boolConjGen

type BoolConjAssoc =
    BoolConj -> BoolConj -> BoolConj -> Bool

type BoolConjIdentity = BoolConj -> Bool

-- #7. BoolDisj
newtype BoolDisj = BoolDisj Bool
  deriving (Eq, Show)

instance Semigroup BoolDisj where
  (<>) (BoolDisj False) (BoolDisj False) = BoolDisj False
  (<>) (BoolDisj _) (BoolDisj _) = BoolDisj True

instance Monoid BoolDisj where
  mempty = BoolDisj False
  mappend = (<>)

boolDisjGen :: Gen BoolDisj
boolDisjGen = do
  a <- arbitrary
  return $ BoolDisj a

instance Arbitrary BoolDisj where
  arbitrary = boolDisjGen

type BoolDisjAssoc =
    BoolDisj -> BoolDisj -> BoolDisj -> Bool

type BoolDisjIdentity = BoolDisj -> Bool

-- #9. Combine a b
-- TODO
newtype Combine a b =
  Combine { unCombine :: (a -> b) }

instance Eq (Combine a b) where
  (==) (Combine f) (Combine f') = undefined

instance (Show a, Show b) => Show (Combine a b) where
  show (Combine a) = undefined


instance (Semigroup a, Semigroup b)
  => Semigroup (Combine a b) where
     (Combine f) <> (Combine f') = Combine (f <> f')

instance (Monoid a, Monoid b)
 => Monoid (Combine a b) where
    mempty = Combine mempty
    mappend = (<>)

combineGen :: (CoArbitrary a, Arbitrary b)
  => Gen (Combine a b)
combineGen = do
  f <- arbitrary
  return $ Combine f

instance (CoArbitrary a, Arbitrary b)
 => Arbitrary (Combine a b) where
   arbitrary = combineGen

type CombineAssoc =
     (Combine (Sum Int) (Sum Double))
  -> (Combine (Sum Int) (Sum Double))
  -> (Combine (Sum Int) (Sum Double))
  -> Bool

-- #10. Comp a
-- TODO
newtype Comp a =
  Comp { unComp :: (a -> a) }

instance Eq (Comp a) where
  (==) (Comp f) (Comp f') =
    undefined

instance Show (Comp a) where
  show _ = undefined

instance Semigroup a
  => Semigroup (Comp a) where
     (Comp f) <> (Comp f') = Comp (f <> f')

instance Monoid a => Monoid (Comp a) where
   mempty = Comp mempty
   mappend = (<>)

compGen :: (CoArbitrary a, Arbitrary a)
  => Gen (Comp a)
compGen = do
 f <- arbitrary
 return $ Comp f

instance (CoArbitrary a, Arbitrary a)
  => Arbitrary (Comp a) where
  arbitrary = compGen

type CompAssoc =
     (Comp (Sum Int))
  -> (Comp (Sum Int))
  -> (Comp (Sum Int))
  -> Bool

type CompIdentity = (Comp (Sum Int)) -> Bool

main :: IO ()
main = do
  putStrLn "\nTest Trivial Association"
  quickCheck (semigroupAssoc :: TrivAssoc)
  putStrLn "\nTest Trivial Identity"
  quickCheck (monoidLeftIdentity :: TrivIdentity)
  quickCheck (monoidRightIdentity :: TrivIdentity)
  putStrLn "\nTest Identity Association"
  quickCheck (semigroupAssoc :: IdentityAssoc)
  putStrLn "\nTest Identity identity"
  quickCheck (monoidLeftIdentity :: IdentityIdentity)
  quickCheck (monoidRightIdentity :: IdentityIdentity)
  putStrLn "\nTest Two Association"
  quickCheck (semigroupAssoc :: TwoAssoc)
  putStrLn "\nTest Two identity"
  quickCheck (monoidLeftIdentity :: TwoIdentity)
  quickCheck (monoidRightIdentity :: TwoIdentity)
  putStrLn "\nTest Three Association"
  quickCheck (semigroupAssoc :: ThreeAssoc)
  putStrLn "\nTest Three identity"
  quickCheck (monoidLeftIdentity :: ThreeIdentity)
  quickCheck (monoidRightIdentity :: ThreeIdentity)
  putStrLn "\nTest Four Association"
  quickCheck (semigroupAssoc :: FourAssoc)
  putStrLn "\nTest Four identity"
  quickCheck (monoidLeftIdentity :: FourIdentity)
  quickCheck (monoidRightIdentity :: FourIdentity)
  putStrLn "\nTest BoolConj Association"
  quickCheck (semigroupAssoc :: BoolConjAssoc)
  putStrLn "\nTest BoolConj identity"
  quickCheck (monoidLeftIdentity :: BoolConjIdentity)
  quickCheck (monoidRightIdentity :: BoolConjIdentity)
  putStrLn "\nTest BoolDisj Association"
  quickCheck (semigroupAssoc :: BoolDisjAssoc)
  putStrLn "\nTest BoolDisj identity"
  quickCheck (monoidLeftIdentity :: BoolDisjIdentity)
  quickCheck (monoidRightIdentity :: BoolDisjIdentity)
  putStrLn "\nTest Combine Association: TODO"
  -- quickCheck (semigroupAssoc :: CombineAssoc)
  putStrLn "\nTest Combine identity: TODO"
  -- quickCheck (monoidLeftIdentity :: CombineIdentity)
  -- quickCheck (monoidRightIdentity :: CombineIdentity)
  putStrLn "\nTest Comp Association: TODO"
  -- quickCheck (semigroupAssoc :: CompAssoc)
  putStrLn "\nTest Comp identity: TODO"
  -- quickCheck (monoidLeftIdentity :: CompIdentity)
  -- quickCheck (monoidRightIdentity :: CompIdentity)
