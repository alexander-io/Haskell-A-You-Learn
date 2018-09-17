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

-- allEven lst = [if odd x then False else True| x <- lst]

-- removeLast lst
-- removes the last item from lst (precisely, it returns a list containing everything in lst except the last item)
removeLast [] = error "error"
removeLast [_] = []
removeLast (x:xs) = x : (removeLast xs)

allEven [] = True
allEven [n] = even n
allEven (n:ns) = even n && allEven ns
