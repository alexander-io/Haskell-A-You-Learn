{-# LANGUAGE ParallelListComp #-}

-- CS 291 Assignment #2
-- Due Monday, September 17th
-- Alexander Harris
-- Professor B. Richards

-- 1. Define the function tuplesSummingToZero that takes a list of two-tuples as input and returns those tuples from the input list whose values sum to zero. the tuples in the output list should appear in the same order as they did in the input list. for full credit, use a list comprehension in solution.
tuplesSummingToZero [] = []
-- [use | generator, guard]
-- take a list, select each tuple from list as long as (elem_00 + elem_01) evaluates to zero
tuplesSummingToZero lst = [(a,b) | (a,b) <- lst, a + b == 0]

-- 2. Time to practice some recursion! Define the function largestDiff, which takes a list of  numbers and returns the largest difference between adjacent values, using recursion
-- (use the built in abs  function to  ensure diffs are always positive) for full credit, make sure you handle the two error cases shown below
largestDiff [] = error "cannot find the largest difference of an empty list"
largestDiff [x] = error "cannot compute a difference with only one element"
largestDiff [x,xx] = x-xx
largestDiff [x,xx,xxx] = max (abs(x-xx)) (abs(xx-xxx))
largestDiff (x:xx:xs) =  max (abs(x-xx)) (abs(largestDiff (xx:xs)))

-- 3. Define take', your own recursive version of the built in function take. it should work as show below.
-- (your solution should'nt call the built-in function)
-- NON-RECURSIVE, list comprehension solution :
-- take' num lst = [element | element <- lst | x <- [1..num]]
take' 0 lst = []
take' 1 (x:xs) = [x]
take' 2 (x:xs) = x : take' (2-1) xs
take' n (x:xs) = x : take' (n-1) xs

-- 4. define the function subsequence of  type Eq a => [a] -> [a] -> Bool. It should return True if the first list of items is found in consecutive positions anywhere within the second list. for example :
-- > subsequence ['a', 'b'] ['a', 'b', 'c']
-- True
subsequence [] _ = True
subsequence _ [] = False
subsequence [x] lst = elem x lst
subsequence sub lst = if take (length sub) lst == sub
                      then True
                      else subsequence sub (drop (length sub) lst)
