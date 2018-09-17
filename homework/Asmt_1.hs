-- CS 291 Assignment #1
-- Due Monday, Septemer 10th by 11:59pm
-- Alexander Harris
-- Professor Brad Richards
-- http://mathcs.pugetsound.edu/~brichards/Classes/291/Asmts/01/asmt.html

-- 1. define a one argument function that returns the square of  its input. it should work with either integers  or floats as inputs.
square x = x*x
-- *Main> square 5
-- 25
-- *Main> square (-2)
-- 4
-- *Main> square 1.414
-- 1.9993959999999997

-- 2. define a one-argument function called absolute that returns the value of its input. for full credit, implement it by first squaring the input  using  the square function above, then taking the  square root via the built-in function sqrt
absolute x = sqrt (square x)
-- *Main> absolute 42
-- 42.0
-- *Main> absolute (-5)
-- 5.0

-- 3. define a three argument function called sumTo that returns an expression of type bool. it should return  true if the first two arguments sum to the third, false otherwise. your solution only has to  work for  integer inputs
sumTo x xx xxx = if x + xx == xxx then True else False
-- *Main> sumTo 5 7 12
-- True
-- *Main> sumTo 5 (-5) 0
-- True
-- *Main> sumTo 5 7 100
-- False

-- 4. define a function called largestSqure that takes two integers as inputs -- a lower and upper bound. it should apply your square function to each of  the values from the lower to the upper (inclusive) and return the largest result produed by square . for example, in the first test  below results in three calls to squre -- using 3, 4, and 5 as inputs -- and returns 25 since it's the  largest output produced by any of the three inputs. the function  should produce a program error if the first input is larger than the second. note : solutions using explicit recursion will be grudgingly tolerated, but those  avoiding it  will make my heart sing
largestSquare lower upper = if upper > lower then maximum [x*x | x <- [lower..upper]] else error "First argument must be <= the second..."

-- 5. define a function, any function that has the  type show  below. for  full credit, function should exhibit this type signature without needing an explicit type annotation
foo (a,b) (c,d) x = if x then (a,b) else (c,d)
