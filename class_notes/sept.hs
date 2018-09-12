-- acronym s = [(c:_) | c <- s]
acronym s = [x | x <- s, elem x ['A'..'Z']]

hideLower str = [ if c `elem` ['A'..'Z'] then c else '_' | c <- str]

doubleAll nums = [2*n | n<- nums]

copy item num = [item | _<-[1..num]]
