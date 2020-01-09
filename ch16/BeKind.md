# Exercises: Be Kind

1. What's the kind of `a`?

```haskell
a -> a
```

The kind of `a` is `*`.

2. What are the kinds of `b` and `T`? (The `T` is capitalized on purpose!)

```haskell
a -> b a -> T (b a)
```

The kind of `b` is `* -> *`. The kind of `T` is `* -> *`

3. What's the kind of `c`?

```haskell
c a b -> c b a
```

The kind of `c` is `* -> * -> *`.
