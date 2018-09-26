{-# LANGUAGE ParallelListComp #-}
-- CS 291
-- Assignment #3
-- Due Monday, Sept. 24th

-- Introduction
-- The problems below will give more practice thinking like a functional programmer. try to avoid writing explicitly recursive solutions as much as possible. instead, rely  upon built-in functions when you can (e.g. map,  filter, foldr, along with list comprehensions and other basic tools)

-- 1. Haskell doesn't allow us to test functions for equality, but we can  write  a function that  at  least does a crude check as to whether two functions return the same values. Define the function sameOutput that takes  two functions as  arguments, both of which  map integers to integers, and checks to see if  they return the same  outputs for all inputvalues within a  specific range of values.
sameOutput fn1 fn2 lower upper = if elem False [fn1 x == fn2 x | x <- [lower..upper]] then False else True

-- 2. Define a function mostFrequent that returns the item that occurs most frequently in an input list

-- learn to  count for comparisons
count x y = if x == y then 1 else 0

-- define recursive pattern to  determine the number of  occurences of an element in a list
num_occurrences x [] = 0
num_occurrences x (n:ns) = count x n + num_occurrences x ns

-- use  the num_occurrences to create a tuple containing the element with the number of occurrences in the list
tuple_occurrences x lst = (x, (num_occurrences x lst))

-- create  a list  of tuples -> (elem:occurrences) corresponding to a  list
tuple_occurrences_all lst = [tuple_occurrences x lst |x<-lst]

-- learn how to compare tuples based on number of  occurrences, (elem:occurrences)
compare_tuple (a1,a2) (b1,b2) = if a2 >= b2 then (a1,a2) else (b1,b2)

-- define recursive pattern to cycle through a list and determine  the max tuple based on occurrences
find_max_tuple [] = error "error"
find_max_tuple [(x,xx)] = (x,xx)
find_max_tuple [(x,xx), (y,yy)] = compare_tuple (x, xx) (y, yy)
find_max_tuple ((x,xx):xs) = compare_tuple (x, xx) (find_max_tuple xs)

-- get the 'elem' value out of the (elem:occurrences) tuple
get_tuple_elem (x,xx) = x

-- define most  frequent
mostFrequent [] = error "error"
mostFrequent [x] = x
mostFrequent lst =  get_tuple_elem (find_max_tuple (tuple_occurrences_all lst))

-- 3. In the next problem, you'll write a higher-order function that performs numberical integration. one if its inputs is a function that  takes as inputs two y-coordinates and the distane between them along the x-axis. it returns the approximate area under the curve that connects the y-coordinates. here, you'll write two different approximation functions that can be used as inputs below

areaRect leftEdgeHeight rightEdgeHight width = leftEdgeHeight * width
areaTrap leftEdgeHeight rightEdgeHight width
  | leftEdgeHeight == rightEdgeHight = leftEdgeHeight * width
  | leftEdgeHeight > rightEdgeHight = abs (leftEdgeHeight - (0.5*(abs leftEdgeHeight - abs rightEdgeHight))) * width
  | leftEdgeHeight < rightEdgeHight = abs (rightEdgeHight - (0.5*(abs rightEdgeHight - abs leftEdgeHeight))) * width

-- 4. define the function integrate that approximates the integral of an input function. its first argument is a function like the ones from the  previous problem, that determines how  hte  area of a vertical slice is approximated. the next  three arguments are  the th of the slices, and the starting and ending x-coordinates. the final argument is  the function  to be integrated.

-- for  example, the first invocation below is  using the trapezoid rule to calculate the integral of (\x->x*x), the function  that squares the argument, from  0 to 100 using  strips of width 0.1

-- > integrate areaTrap 0.1 0 100 (\x->x*x)
-- 333333.500000013
-- > integrate areaRect 0.1 0 100 (\x->x*x)
-- 332833.500000013
-- > integrate areaTrap 0.3 0 1 (\x->x)
-- 0.5

integrate fn1 width start end fn2 = (sum [fn1 xx xx width | xx <- [fn2 x | x<-[start..end]]])*10


-- 5. define a function called trapInt that peurforms numerical integration but always uses the trapezoid method with a spacing of 0.1 between evaluation points. it takes three inputs: the starting and ending x-coordinates and a function to  be integrated. for full  credit, define trapInt using partial application of integrate.
trapInt start end fn = integrate areaTrap 0.1 start end fn
