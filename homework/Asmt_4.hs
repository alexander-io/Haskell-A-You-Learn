

-- 1. Define the function generalizeToTuples that  takes a one-argument function as input and  generalizes it so that it operates on tuples of inputs instead more specifically, your function should return a new function that performs  the original function but on pairs of values, in which the results being returned in a two-tuple. in the sample output, the  square function is being passed to generalizetoTuples to  produce squarePairs. The resulting function is  shown operating on pairs of values in a two-tuple
generalizeToTuples fn (a,b) = (fn a, fn b)

-- 2. Define a function stringify that takes a one-argument function and  returns a new function  that produces strings as return values. for example, in the first interaction it produces a modified version of  the square function the returns its results as strings instead of numbers. (E.g. "100" instead of 100). The same is  done for  the function that checks whether its input is 5, and  for the head function.
stringify fn x = show (fn x)

-- 3. Define  the function restrict. it takes two functions as inputs : A one-argument function,  and a  second  boolean-valued  function that describes the range of legal values to the first function. your  restrict function should return a  function that  first checks  its arguments to see if it's legal, then returns a maybe value: Just and the  expected output if the input is within range, and Nothing if the  input  is not  in  rage. For example, in  the  first use below restrict is being passed the square function,and a function that returns true for values less than 20. the output function returns Just 25 for an input  of 5 since the 5 is within range.
restrict fn range_fn x = if range_fn x then Just (fn x) else Nothing

-- 4. in class we worked through an example involving stirng replacement functions : we started with a  function that took a string as input  and returned a string -- it watched  for a  particular input string  and  replaced  it  with another, or retunred the  input  unchanged. we then wrote a  function  "improver" that took a string-replacement function as  input and  returned a fancier string-replacement function that watched  for an additonal option in  the input

-- here, write a function called train that's a better "improver", it takes a string replacement function and  a list of word pairs (two-tuples of strings), and extends the input function  that  it incorporates all of the new  vocabuary. in  the sample interactions below, train  is  passed the world's least interesting  string-replacement function (it always just  returns  its input  unchanged), and returns a function that watches for three different strings. tehe resulting function (improved) is  mapped across  a  list of words  to  show off its string replacing power, the upgrade  it again by train  so  that ist knows one additional word
-- train fn [] = fn
-- train fn lst =
-- replace old new = (\str -> if str==old then new else str)
-- extend repfn old new =
  -- (\str -> if str==old then new else (repfn str))

get_b (a,b) = b

compare_tuple (a,b) string_to_match = a == string_to_match

vocab_contains_pattern [] string_to_match = False
vocab_contains_pattern [(a,b)] string_to_match = compare_tuple (a,b) string_to_match
vocab_contains_pattern lst string_to_match = if elem True [compare_tuple x string_to_match | x<-lst] then True else False

get_string_replacement [] string_to_match = error "vocab empty"
get_string_replacement [(a,b)] string_to_match = if compare_tuple (a,b) string_to_match then b else string_to_match
get_string_replacement (x:xs) string_to_match = if compare_tuple x string_to_match then get_b x else get_string_replacement xs string_to_match

train fn [] = (\str -> if vocab_contains_pattern [] str then get_string_replacement [] str else str)
train fn [(a,b)] = (\str -> if vocab_contains_pattern [(a,b)] str then get_string_replacement [(a,b)] str else str)

train fn lst = (\str -> if vocab_contains_pattern lst str then get_string_replacement lst str else str)
