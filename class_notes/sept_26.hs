maxFinder fn low high = foldr1 max outputs
  where
    outputs = map fn [low..high]

-- return true of all items  in lst are identical
allEqual lst = length (filter (/= head lst) lst ) == 0

-- return true if all items in lst are  distinct
allDifferent lst = lst == filter (\e->(1==(...))) lst
  where
    occurs e = length (filter (==e) lst)


-- scale lst =
