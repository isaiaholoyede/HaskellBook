# 8.6 Chapter Exercises

## Review of types

1. What is the type of `[[True, False],[True, True],[False, True]]`? d) `[[Bool]]`
2. Which of the following has the same type as `[[True, False],[True, True],[False, True]]`? b) `[[3 = 3], [6 > 5], [3 < 4]]`
3. For the following function

    ```haskell
    func :: [a] -> [a] -> [a]
    func x y = x ++ y
    ```

    Which of the following is true?

    a) `x` and `y` must be of the same type.
    b) `x` and `y` must both be lists.
    c) if `x` is a `String` then `y` must be a `String`
    d) all of the above (**Correct Answer**)

4. For the `func` code above, which is a valid application of `func` to both of its arguments?
    b) `func "Hello" "World"`

