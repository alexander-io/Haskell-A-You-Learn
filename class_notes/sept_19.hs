-- this gives an  infinite type warning
-- foo [] = []
-- foo lst = foo (head lst)

silly fn arg = (fn arg)

negate fn arg = fn  (-arg)

applyToPos fn arg = fn (abs arg)

square n = n * n
maxOutput fn arg1 arg2 =  max (fn arg1) (fn arg2)

pickAFn fn1 fn2 arg
  | arg < 0 = fn1 arg
  | otherwise = fn2 arg

compose fn1 fn2 arg = (fn1(fn2 arg))

twice fn arg = fn (fn arg)

incrementAll [] = []
incrementAll (n:ns) = (n+1) : incrementAll ns

squareAll [] = []
squareAll (n:ns) = (n*n) : squareAll ns

map' _ [] = []
map' fn (x:xs) = (fn x) : map fn xs

keepEvens [] = []
keepEvens (n:ns)
  | even n = n : keepEvens ns
  | otherwise = keepEvens ns

keepShortStrings [] = []
keepShortStrings (s:ss)
  | length s < 3 = s : keepShortStrings ss
  | otherwise = keepShortStrings ss

filter' _ [] = []
filter' fn (x:xs)
  | fn x = x : filter' fn xs
  | otherwise = filter' fn xs


-- anonymous functions, lambda expression :

  -- lambda expression
  -- \s -> length s < 3

  -- *Main> map (\n->n+1) [1..10]
  -- [2,3,4,5,6,7,8,9,10,11] 
