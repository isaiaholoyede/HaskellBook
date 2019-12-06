# Exercises: Cardinality

```haskell
data PugType = PugData

data Airline = PapuAir
             | CatapultsR'us
             | TakeYourChancesUnited
             deriving (Eq, Show)
```

1. The cardinality of `data PugType = PugData` is one.
2. The cardinality of `Airline` type constructor is three.
3. The cardinality of `Int16` is `2^16 = 65536`.
4. The cardinality of `Int` on my computer is `2^64 = 18446744073709551616`.
   The cardinality of `Integer` is infinite since Integer is not bound.
5. The connection between the `8` in `Int8` and that type's cardinality of `256` is `2^8`.
