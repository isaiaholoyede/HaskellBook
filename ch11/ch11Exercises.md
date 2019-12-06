# 11.18 Chapter Exercises

## Multiple choice

1. Given the following datatype

    ```haskell
    data Weekday =
        Monday
      | Tuesday
      | Wednesday
      | Thursday
      | Friday
    ```
    
    We can say: a) Weekday is a type with five data constructors.

2. and with the same datatype definition in mind, what is they type of the following function, f?

    ```haskell
    f Friday = "Miller Time"
    ```
    
    c) f :: Weekday -> String

3. Types defined with the data keyword
    b) must begin with a capital letter

4. The function `g xs = xs !! (length xs - 1)`
    c) delivers the final element of `xs`
