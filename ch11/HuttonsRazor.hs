module HuttonsRazor where

data Expr = Lit Integer
          | Add Expr Expr
          deriving Show

-- 1. eval function
eval :: Expr -> Integer
eval (Lit x) = x
eval (Add x y) = eval x + eval y

-- 2. Printer for the expressions
printExpr :: Expr -> String
printExpr (Lit x) = show x
printExpr (Add x y) = printExpr x ++ " + " ++ printExpr y
