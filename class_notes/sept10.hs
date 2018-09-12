-- [use | generator, filter]
foo start end = [ n | n<-[start..end], minimum n]

foo1 start end = [start..end]

category 0 = "none"
category 1 = "one"
category 2 = "several"
category _ = "many"

match _ 0 = "first rule"
match 1 _ = "second rule"
match _ _ = "general rule"

-- function expecting list as input
describe [] = "empty list"
describe [item] = "single iten"
descrive (x:xs) = "head is "++(show x)++" and tail is "++(show xs)
-- *Main> describe []
-- empty list

-- *Main> describe [9]
-- head is 9 and tail is []
