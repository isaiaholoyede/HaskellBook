# 5.8 Chapter Exercises

## Multiple Choice

1. (c) A value of type `[a]` is a list whose elements are all of some type `a`.
2. (a) A function of type `[[a]] -> [a]` could take a list of strings as an argument.
3. (b) A function of type `[a] -> Int -> a` returns one element of type `a` from a list.
4. (c) A function of type `(a, b) -> a` takes a tuple argument and returns the first value.

## Type Variable or Specific Type Constructor?

1. In `f :: Num a => a -> b -> Int -> Int`, `a` is constrained polymorphic (`Num`), b is fully polymorphic, and `Int` is a concrete type constructor.
2. In `f :: zed -> Zed -> Blah`, `zed` is fully polymorphic, `Zed` and `Blah` are concrete type constructors.
3. In `f :: Enum b => a -> b -> C`, `a` is fully polymorphic, `b` is constrained polymorphic (`Enum`), and `C` is a concrete type constructor.
4. In `f :: f -> g -> C`, `f` and `g` are fully polymorphic and `C` is a concrete type constructor.