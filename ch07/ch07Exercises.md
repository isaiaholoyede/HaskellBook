# 7.11 Chapter Exercises

## Multiple Choice

1. A polymorphic function d) may resolve to values of different types, depending on inputs.
2. Two functions named `f` and `g` have types `Char -> String` and `String -> [String]` respectively. The composed function `g . f` has the type b) `Char -> [String]`.
3. A function `f` has the type `Ord a => a -> a -> Bool` and we apply it to one numeric value. What is the type now? d) `(Ord a, Num a) :: a -> Bool`
4. A function with the type `(a -> b) -> c` is b) a higher-order function.
5. Given the following definition of `f`, what is the type of `f True`? a) `f True :: Bool`

```haskell
f :: a -> a
f x = x
```
