# Typecheck `(fmap.fmap)`

We plan to show how `(fmap . fmap)` typechecks:

```haskell
(.) :: (b -> c) -> (a -> b ) -> a -> c
--       fmap        fmap
fmap :: Functor f => (m -> n) -> f m -> f n
fmap :: Functor g => (x -> y) -> g x -> g y
```

We proceed by substituting the given `fmap` into the composition function.

For the `(b -> c)`, we can infer the following:

- `b` is `(m -> n)`
- `c` is `f m -> f n`

We procced by substituting the above for all occurrences of `b` and `c` in the composition function.

```haskell
(.) :: Functor f => ((m -> n) -> (f m -> f n)) -- First operand
                 -> (a -> (m -> n)) -- Second operand
                 -> a -> (f m -> f n) -- Result
```

For the second operand `(a -> (m -> n))`, we can infer the following:

- `a` is `x -> y`
- `m -> n` is `g x -> g y`
- `m` is `g x`
- `n` is `g y`

We procced by substituting the above for all occurrences of `a`, `m`, and `n` in the composition function.

```haskell
(.) :: (Functor f, Functor g) => ((g x -> g y) -> (f g x -> f g y)) -- First operand
                            -> ((x -> y) -> (g x -> g y)) -- Second operand
                            -> (x -> y) -> (f (g x) -> f (g y)) -- Result
```

Therefore, the type of `(fmap . fmap)` is:

```haskell
(fmap . fmap) ::  (Functor f, Functor g) => (x -> y) -> f (g x) -> f (g y)
```

## Reference

[How (fmap . fmap) typechecks](https://stackoverflow.com/questions/23030638/how-fmap-fmap-typechecks)
