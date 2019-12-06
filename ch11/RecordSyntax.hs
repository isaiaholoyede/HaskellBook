module RecordSyntax where

data Person = Person {
        name :: String
    ,   age :: Int 
    } deriving (Eq, Show)

-- sample data
jm = Person {name = "julie", age =  108}
ca = Person { name = "chris", age = 16}
