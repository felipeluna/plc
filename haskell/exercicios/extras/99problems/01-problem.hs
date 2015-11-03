-- Find the last element of a list.
myLast :: [a] -> a
myLast [] = error "empty list"
myLast [a] = a
myLast (_:xs) = myLast xs
