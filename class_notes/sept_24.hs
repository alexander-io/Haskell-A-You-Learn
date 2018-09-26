largest [] = error "not defined on empty lists"
largest [n] = n
largest (n:ns) = max n (largest ns)

smallest [] = error "Not defined on empty lists"
smallest [n] = n
smallest (n:ns) = min n (smallest ns)

reduce _ [] = error "not defined on empty lists"
reduce _ [x] = x
reduce fn (x:xs) = fn x (reduce fn  xs)
-- *Main> reduce (&&) [True, True]
noFalses [] = True
noFalses (b:bs) = b && noFalses bs

concatAll [] = []
concatAll (l:ls) = l ++ concatAll ls

-- this is close, but doesn;'t work form [] as input

concatAll' lsts = reduce (++) lsts
-- *Main> concatAll' ["hello ","world"]


-- reduce' takes a fn and the value to  return  for the base case
reduce' _ base [] = base
reduce' fn base (x:xs) = fn x (reduce' fn base xs)

-- reduce' is equiv oto  the built in foldr
-- weirdKeepEvens = foldr (\n acc->if even n  then  n:acc else acc) []

-- map lst -> lst, same length
-- filter -> reduce original list
-- reduce -> take list and generate value


-- start doing applicative programming : apply  existing patterns/tools
-- rather  than writing our own  recursive solutions when possible

elem' e lst =  (filter (/=e) lst) /= []

elem'' e lst = not (null (filter (/=e) lst))
