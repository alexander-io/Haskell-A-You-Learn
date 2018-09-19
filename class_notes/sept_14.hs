-- makePairs takes a list of data items, and pairs them up to
-- two-tuples
makePairs [] = []
makePairs [x] = [(x,x)]
makePairs (x:y:xs) = (x,y) : makePairs xs

-- makePairs' lst = (head lst, head (tail lst)) : makePairs (tail (tail lst))
maximum' [] = error "input has to have at least one input"
maximum' [n] = n
maximum' (n:ns) = max n (maximum' ns)

-- allEven lst
-- returns true if all items in lst are  even, false otherwise (don't call any of the functions above for help)

-- removeLast lst
-- removes the last item from lst (precisely, it returns a list containing everything in lst except the last item)
removeLast [] = error "error"
removeLast [_] = []
removeLast (x:xs) = x : (removeLast xs)

allEven [] = True
allEven [n] = even n
allEven (n:ns) = even n && allEven ns

-- more optimistic version
allEven' [] = True
allEven' (n:ns) = even n && allEven' ns

allEven'' [] = True
allEven'' (n:ns)
  | even n = allEven'' ns
  | otherwise = False

allEven''' lst = (lst == [n | n<-lst, even n])

removeFirstEven [] = []
removeFirstEven (n:ns)
  | even n = ns
  | otherwise = n : removeFirstEven ns

area r =
  let pi = 3.14159 in r*r*pi

area' r = r*r*pi
  where
    pi = 3.14159

evensUpToN n = result
  where
    candidates = [1..n]
    result = [ m | m <- candidates, even m ]

-- even' n = isEven n
--   where
--     isEven m
--       | m == 0 = True
--       | m > 0 = isOdd (m-1)
--       | otherwise False
--     isOdd m
--       | m == 1 = True
--       | m > 1 =  isEven (m-1)
--       | otherwise False

-- "lovliest quicksort in all of computing"
qsort [] = []
qsort (pivot:rest) = qsort smalls ++ [pivot] ++ qsort bigs
  where
    smalls = [ n | n <- rest, n <= pivot ]
    bigs   = [ n | n <- rest, n > pivot]
