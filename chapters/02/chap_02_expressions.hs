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
