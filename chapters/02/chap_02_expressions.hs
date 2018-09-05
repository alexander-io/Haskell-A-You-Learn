-- baby's first functions

-- define function doubleMe  with one  param x
doubleMe x = x + x

-- define function doubleUs with two params x & y
doubleUs x y = x*2 + y*2

-- doubleUs redefined to use doubleMe
doubleUs' x y = doubleMe x + doubleMe y

-- define function that multiplies a number by 2 but only if that number is  smaller  than or  equal to 100
doubleSmallNumber x = if x > 100
                        then x
                        else x*2

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

conanO'Brien = "It's a-me, Conan O'Brien!"


-- to retrieve an element from a  list by index use '!!'
getElem index list = list !! index

-- head, takes a list and returns its head
getHead list = head list

-- tail, takes a list and returns its tail,
-- in other words, it chops off the list's head
getTail list = tail list

-- last, takes a list nd returns the last element
getLast list = last list

-- init, takes a list and returns everything except its last element
getInit list = init list

-- length, takes a list and returns its length
getLength list = length list

-- null, checks if a list is empty, if it is, it returns true,  otherwise false
isEmpty list = null list

-- reverse, reverses a list
reverseList list = reverse list

-- take, takes a doubleSmallNumberber and a list, it extracts that many elements from the begin of the list
takeNFromList list n = take n list

-- drop, works similar to take, it only drops the  number  of elements from  the beginning of  the list
dropNFromList list n = drop n list

-- maximum, takes a list of stuff that can  be put in some kind of order and returns the biggest element
findMax list = maximum list

-- minimum, return the smallest
findMin list = minimum list

-- sum, takes a list of numbers and returns their sum
calcSum list = sum list

-- product, takes a list of numbers and returns their product
calcProduct list = product list

---- List Ranges / Texas Ranges ----

-- using '..' a range of sequential values can be list-ified
makeListRange x xx = [x..xx]
-- NOTE to make a  list from  20 -> 1,  you can't just issue [20..1] ...
-- instead issue [20,19..1]

-- infinite range
makeInfinListRangeStep x  = [0,x,..]

-- haskell is  lazy, therefore it can take n elements from a range without computing an  infinite  range
takeNElementsFromRangeXY n x y = take n [x..y]

-- cycle, takes a list  and cycles  it into an infinite list. if  you try just to display  the result, it will go on forever so you have to sice it off somewhere
cycleAndTake list n = take n (cycle list)

-- repeat, takes an element and  produces an infinite list  of  just  that element. like cycling a list with only one element
repeatAndTake rep n = take n (repeat rep)

-- replicate, takes an element and produces an infinite  list of  just  that element. like  cycling a list with only one element
replicateAndTake rep n = take n (replicate n rep)

---- List Comprehension ----
-- mathematics has a  similar concept called set comprehensions
-- normally used  for  building more specific sets

-- list comprehension : for every x in range 1 to 10
-- multiply x by 2
-- ghci> [x*2 | x <- [1..10]]

-- for every x in range 1 to 10
-- multiply  x by 2
-- include in result if x*2 >= 12 // true
-- ghci> [x*2 | x <- [1..10], x*2 >= 12]

-- all values from 50 to 100 whose remainder when divided with the number 7 is 3
-- ghci> [ x | x <- [50..100], x `mod` 7 == 3 ]

-- replace each odd  number greater than 1 with bang and each odd number less  than 10 with  boom
-- if a number isn't odd, throw away
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
-- boomBangs [7..13]
-- ["BOOM!","BOOM!","BANG!","BANG!"]

-- all numbers from 10 to  20 that  are  not (exclude) 13, 15, 19
-- ghci> [x | x <- [10..20], x /= 13, x /= 15, x /=19]

-- when drawing from several  lists, comprehensions produce all combinations  of the given lists and then join them by the output function we supply

-- a  list produced by a comprehension  that  draws from  two lists of length 4 will have a length of 16, provided we don't filter them

-- if we have two lists  [2,5,10] and [8,10,11] and we want to  get the products of all the possible combinations between numbers in those lists, here's what we'd do

-- [x*y | x <- [2,5,10], y <- [8,10,11]]
-- [16,20,22,40,50,55,80,100,110]
