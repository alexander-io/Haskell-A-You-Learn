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
