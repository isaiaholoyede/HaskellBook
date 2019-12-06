# Exercises: Dog types

```Haskell
data Doggies a = Husky a | Mastiff a deriving (Eq, Show)

data DogueDeBordeaux doge = DogueDeBordeaux doge
```

  1. `Doggies` is a type constructor, and not a data constructor.
  2. The kind of `Doggies` is `* -> *` because it is yet to be fully applied via type signature.
  3. The kind of `Doggies String` is `*` because it is fully applied.
  4. The type of `Husky 10` is `Num a => Doggies a` because 10 can be any member of the Num typeclass.
  5. The type of `Husky (10 :: Integer)` is `Doggies Integer` because 10 is now a concrete type of Integer.
  6. The type of `Mastiff "Scooby Doo"` is `Doggies String`.
  7. `DogueDeBordeaux` is a type constructor. It can also be a data constructor. Though the type constructor and data constructor use the same name, they are not the same thing.
  8. The type of the data constructor `DogueDeBordeaux` is `doge -> DogueDeBordeaux doge`. Note that the kind of the type constructor `DogueDeBordeaux` is `* -> *`.
  9. The type of `DogueDeBordeaux "doggies"` is `DogueDeBordeaux String`.
