module ExponentiationOrder where
-- Exponentiation in what order?

data Quantum =
    Yes
  | No
  | Both
  deriving (Eq, Show)


convert1 :: Quantum -> Bool
convert1 Yes  = False
convert1 No   = False
convert1 Both = False

convert2 :: Quantum -> Bool
convert2 Yes  = False
convert2 No   = False
convert2 Both = True

convert3 :: Quantum -> Bool
convert3 Yes  = False
convert3 No   = True
convert3 Both = False

convert4 :: Quantum -> Bool
convert4 Yes  = False
convert4 No   = True
convert4 Both = True

convert5 :: Quantum -> Bool
convert5 Yes  = True
convert5 No   = False
convert5 Both = False

convert6 :: Quantum -> Bool
convert6 Yes  = True
convert6 No   = False
convert6 Both = True

convert7 :: Quantum -> Bool
convert7 Yes  = True
convert7 No   = True
convert7 Both = False

convert8 :: Quantum -> Bool
convert8 Yes  = True
convert8 No   = True
convert8 Both = True
