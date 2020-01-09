module InstancesOfFunc where

import Test.QuickCheck
import Test.QuickCheck.Function

functorIdentity :: (Functor f, Eq (f a)) => f a -> Bool
functorIdentity f = fmap id f == f

functorCompose :: (Eq (f c), Functor f) =>
                       (a -> b)
                    -> (b -> c)
                    -> f a
                    -> Bool
functorCompose f g x =
  fmap g (fmap f x) == fmap (g . f) x

functorCompose' :: (Eq (f c), Functor f) =>
                     f a
                  -> Fun a b
                  -> Fun b c
                  -> Bool
functorCompose' x (Fun _ f) (Fun _ g) =
  fmap (g . f) x == (fmap g . fmap f $ x)

-- #1 Identity a
newtype Identity a = Identity a deriving (Eq, Show)

instance Functor Identity where
  fmap f (Identity a) = Identity (f a)

identityGen :: Arbitrary a => Gen (Identity a)
identityGen = Identity <$> arbitrary

-- identityGen = do
--   a <- arbitrary
--   return (Identity a)

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = identityGen

type IdentityFI = Identity String -> Bool

type IntToInt = Fun Int Int
type IdentityFC = Identity Int
    -> IntToInt
    -> IntToInt
    -> Bool

-- #2 Pair a
data Pair a = Pair a a deriving (Eq, Show)

instance Functor Pair where
  fmap f (Pair x y) = Pair (f x) (f y)

pairGen :: Arbitrary a => Gen (Pair a)
pairGen = do
  a <- arbitrary
  Pair a <$> arbitrary

-- pairGen = do
--   a <- arbitrary
--   b <- arbitrary
--   return (Pair a b)

instance Arbitrary a => Arbitrary (Pair a) where
  arbitrary = pairGen

type PairFI = Pair Int -> Bool

type PairFC = Pair Int -> IntToInt -> IntToInt -> Bool

-- #3 Two a b
data Two a b = Two a b deriving (Eq, Show)

instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)

twoGen :: (Arbitrary a, Arbitrary b) => Gen (Two a b)
twoGen = do
  a <- arbitrary
  Two a <$> arbitrary

-- twoGen = do
--   a <- arbitrary
--   b <- arbitrary
--   return (Two a b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = twoGen

type TwoFI = Two Int Int -> Bool

type TwoFC = Two Int Int -> IntToInt -> IntToInt -> Bool

-- #4 Three a b c
data Three a b c = Three a b c deriving (Eq, Show)

instance Functor (Three a b) where
  fmap f (Three a b c) = Three a b (f c)

threeGen :: (Arbitrary a, Arbitrary b, Arbitrary c)
            => Gen (Three a b c)
threeGen = do
  a <- arbitrary
  b <- arbitrary
  Three a b <$> arbitrary

-- threeGen = do
--   a <- arbitrary
--   b <- arbitrary
--   c <- arbitrary
--   return (Three a b c)

instance (Arbitrary a, Arbitrary b, Arbitrary c)
          => Arbitrary (Three a b c) where
  arbitrary = threeGen

type ThreeFI = Three Int Int Int -> Bool

type ThreeFC = Three Int Int Int
      -> IntToInt
      -> IntToInt
      -> Bool

-- #5 Three' a b
data Three' a b = Three' a b b deriving (Eq, Show)

instance Functor (Three' a) where
  fmap f (Three' x y z) = Three' x (f y) (f z)

threeGen' :: (Arbitrary a, Arbitrary b)
            => Gen (Three' a b)
threeGen' = do
  a <- arbitrary
  b <- arbitrary
  Three' a b <$> arbitrary

-- threeGen' = do
--   a <- arbitrary
--   b <- arbitrary
--   c <- arbitrary
--   return (Three' a b c)

instance (Arbitrary a, Arbitrary b)
          => Arbitrary (Three' a b) where
  arbitrary = threeGen'

type ThreeFI' = Three' Int Int -> Bool

type ThreeFC' = Three' Int Int
      -> IntToInt
      -> IntToInt
      -> Bool

-- #6 Four a b c d
data Four a b c d = Four a b c d deriving (Eq, Show)

instance Functor (Four a b c) where
  fmap f (Four a b c d) = Four a b c (f d)

fourGen :: (Arbitrary a, Arbitrary b,
            Arbitrary c, Arbitrary d)
            => Gen (Four a b c d)
fourGen = do
  a <- arbitrary
  b <- arbitrary
  c <- arbitrary
  Four a b c <$> arbitrary

-- fourGen = do
--   a <- arbitrary
--   b <- arbitrary
--   c <- arbitrary
--   d <- arbitrary
--   return (Four a b c d)

instance (Arbitrary a, Arbitrary b,
          Arbitrary c, Arbitrary d)
          => Arbitrary (Four a b c d) where
  arbitrary = fourGen

type FourFI = Four String String String Int -> Bool

type FourFC = Four String String String Int
      -> IntToInt
      -> IntToInt
      -> Bool

-- #7 Four' a b
data Four' a b = Four' a a a b deriving (Eq, Show)

instance Functor (Four' a) where
  fmap f (Four' x y z t) = Four' x y z (f t)

fourGen' :: (Arbitrary a, Arbitrary b)
            => Gen (Four' a b)
fourGen' = do
  a <- arbitrary
  b <- arbitrary
  c <- arbitrary
  Four' a b c <$> arbitrary

-- fourGen' = do
--   a <- arbitrary
--   b <- arbitrary
--   c <- arbitrary
--   d <- arbitrary
--   return (Four' a b c d)

instance (Arbitrary a, Arbitrary b)
          => Arbitrary (Four' a b) where
  arbitrary = fourGen'

type FourFI' = Four' String Int -> Bool

type FourFC' = Three' String Int
      -> IntToInt
      -> IntToInt
      -> Bool

-- #8 Can you implement one for this type? Why? Why not?
-- data Trivial = Trivial
-- We cannot implement Functor instance for this type
-- The kind is *, but we need the kind to be
-- at least `* -> *`

main :: IO ()
main = do
  putStrLn "\nTest Identity Functor Identity"
  quickCheck (functorIdentity :: IdentityFI)
  putStrLn "\nTest Identity Functor Composition"
  quickCheck (functorCompose' :: IdentityFC)
  putStrLn "\nTest Pair Functor Identity"
  quickCheck (functorIdentity :: PairFI)
  putStrLn "\nTest Pair Functor Composition"
  quickCheck (functorCompose' :: PairFC)
  putStrLn "\nTest Two Functor Identity"
  quickCheck (functorIdentity :: TwoFI)
  putStrLn "\nTest Two Functor Composition"
  quickCheck (functorCompose' :: TwoFC)
  putStrLn "\nTest Three Functor Identity"
  quickCheck (functorIdentity :: ThreeFI)
  putStrLn "\nTest Three Functor Composition"
  quickCheck (functorCompose' :: ThreeFC)
  putStrLn "\nTest Three' Functor Identity"
  quickCheck (functorIdentity :: ThreeFI')
  putStrLn "\nTest Three' Functor Composition"
  quickCheck (functorCompose' :: ThreeFC')
  putStrLn "\nTest Four Functor Identity"
  quickCheck (functorIdentity :: FourFI)
  putStrLn "\nTest Four Functor Composition"
  quickCheck (functorCompose' :: FourFC)
  putStrLn "\nTest Four' Functor Identity"
  quickCheck (functorIdentity :: FourFI')
  putStrLn "\nTest Four' Functor Composition"
  quickCheck (functorCompose' :: FourFC')
