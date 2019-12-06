# Exercises: For Example

```haskell
data Example = MakeExample deriving Show
data Example' = MakeExample' Integer deriving Show
```

1. The type of data constructor `MakeExample` is `Example`. When you request the type of `Example`, we receive an error: `error: Data constructor not in scope: Example`. We should be requesting the kind of `Example` since `Example` is a type constructor. The kind of `Example` is `*`.
2. The typeclass instance defined for Example is the `Show` typeclass instance.
3. The type of data constructor `MakeExample' Integer` is `Integer -> Example`. It takes Integer as its only argument.
