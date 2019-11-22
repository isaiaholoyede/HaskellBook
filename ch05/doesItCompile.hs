module DoesItCompile where

-- 1. `wahoo` breaks because `bigNum` is a value, not a function.
-- bigNum = (^) 5 $ 10 
-- wahoo = bigNum $ 10

-- We can have the code below instead:
bigNum = (^ 5)
wahoo = bigNum 10

-- 2. This works. W
-- x = print
-- y = print "woohoo!" 
-- z = x "hello world"

-- We can improve as shown below:
x = print
y = x "woohoo!"
z = x "hello world"

-- 3. `c` and `d` breaks because `b` is a value, not a function. 
-- a = (+) b=5
-- c = b 10 
-- d = c 200

-- We can use the code below instead:
a = (+)
b = 5
c = a b 10
d = a c 200

-- 4. `b` breaks because `c` is not in scope. 
-- a = 12 + b
-- b = 10000 * c

-- I can fix by putting `c` in scope. 
-- Order does not matter if code is in a source file. 
-- In `GHCi`, I will need to define `c` first.

a' = 12 + b'
b' = 10000 * c'
c' = 1
