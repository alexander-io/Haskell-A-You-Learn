-- function definition of kind
-- pipe character known as guard in this case, guarded expression
kind n
 | even n = "It's even!"
 | odd  n = "it's odd"
 | otherwise = "idk"

-- guarded expression to determine grade
grade n
  | n > 90 = "A"
  | n > 80 = "B"
  | n > 70 = "C"
  | n > 60 = "D"
  | otherwise "dude, shape up"
