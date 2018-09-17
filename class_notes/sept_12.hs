-- function definition of kind
-- pipe character known as guard in this case, guarded expression
kind n
 | even n = "It's even!"
 | odd  n = "it's odd"
 | otherwise = "idk"

-- guarded expression to determine grade
-- grade n
--   | n > 90 = "A"
--   | n > 80 = "B"
--   | n > 70 = "C"
--   | n > 60 = "D"
--   | otherwise "dude, shape up"
--
-- -- although list comprehensions are useful, sometimes it can allow more power to write our own recursive functions
length' [] = 0
length' (x:lst_of_xs) = 1 + length' lst_of_xs
--
--
-- -- removeNth 1st n returns a list that contains the same items
-- -- as list, but with the neth item missing
-- -- handle case for the empty list, param1 : empty list, param2 and index at all,  throw error
removeNth [] _ = error "not that many items"
removeNth (x:xs) 0 = xs
removeNth (x:xs) n = x : removeNth xs (n-1)


-- practice with recursion
-- 1. incrementAll 1st
-- increment each num in list
incrementAll [] = []
incrementAll (x:xs) = (x+1) : incrementAll xs

countEvens [] = 0
countEvens (x:xs)
  | even x = 1 + countEvens xs
  | otherwise = countEvens xs

countEvens' [] = 0
countEvens' (n:ns) =
  (if even n then 1 else 0) + countEvens' ns

keepEvens [] = 0
keepEvens (x:xs)
  | even x = x : keepEvens xs
  | otherwise = keepEvens xs
