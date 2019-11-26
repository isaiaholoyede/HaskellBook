module ReviewingCurrying where

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty  = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- 1. The value of `appedCatty "woohoo!"` is 
-- `"woops mrow woohoo!"`.
-- 2. `frappe "1"` gives `"1 mrow haha"`.
-- 3. `frappe (appedCatty "2")` 
-- gives `"woops mrow 2 mrow haha"`
-- 4. `appedCatty (frappe "blue")` 
-- gives `"woops mrow blue mrow haha"`
-- 5. `cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))` 
-- gives `"pink mrow haha mrow green mrow woops mrow blue"`.
-- 6. `cattyConny (flippy "Pugs" "are") "awesome"` gives `"are mrow Pugs mrow awesome"`