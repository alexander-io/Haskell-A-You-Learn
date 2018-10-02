-- here is a a  function that builds and returns a custom function
makeLimiter upperBound = (min upperBound)

-- we  can use a similar  technique to create a string replacer
replace old new = (\str -> if str==old then new else str)
-- *Main> map (replace "hello" "aloha") ["hello", "I", "said", "hello"]
-- ["aloha","I","said","aloha"]


-- what if we wanted a larger vocabulary? we want  to  watch for more  than just  one  word, and  have replacements  for each.
-- one way to do that  could  be  to write a  "function improver" that takes an  existing replacement function and  extends  it  to hande anotherr  pair of strings

extend repfn old new =
  (\str -> if str==old then new else (repfn str))

exaggerate =  finalVersion
  where
    repFn = replace "good" "great"
    betterFn = extend repFn "bad" "pleasant"
    finalVersion = extend betterFn "terrible" "ok"

-- the sieve algorith for finding primes feels similar, the sieve is a  function  that decides who gets through, but  the  function evolves over  time  to  be more restrictive. we'll write a  recursive version that keeps improving the 'who  do we keep' function as  it goes
-- for each n that we let through  the sieve, we update the keeperfn so that we only keep future  numbers if  keeperFn says it's okay, AND  those numbers aren't multiples of  n

sieve fn  [] = []
sieve fn lst = results
  where
    (n:ns) = filter fn keeperFn lst
    newKeeperFn = (\m -> m `mod` n /= 0 && keeperFn m)
    results = n : sieve newKeeperFn ns
