-- Exercises: Vehicles
module Vehicles where

data Price = Price Integer deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = PapuAir
             | CatapultsR'us
             | TakeYourChancesUnited
             deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
             | Plane Airline Size
             deriving (Eq, Show)

data Size = Size Integer deriving (Eq, Show)

--  Question 1: myCar has a type of Vehicle.
myCar :: Vehicle
myCar = Car Mini (Price 14000)

urCar :: Vehicle
urCar = Car Mazda (Price 20000)

clownCar :: Vehicle
clownCar = Car Tata (Price 7000)

doge :: Vehicle
doge = Plane PapuAir (Size 100000)

-- Question 2 - We are just pattern matching.
-- The Manufacturer and Price can be ignored in the pattern matching.
isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _         = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _         = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- Question 3
getManu :: Vehicle -> Manufacturer
getManu (Car m _) = m
getManu _ = error "No Manfacturer"

-- Question 4: `getManu` function will throw an error 
-- if we apply the function on a Plane data.

-- Question 5: See code above to see how the `Plane` constructor 
-- has been modified to add the size of the plane as an argument 
-- to the `Plane` constructor.
