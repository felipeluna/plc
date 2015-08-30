-- Find the last but one element of a list.

myButLast :: [a] -> a
myButLast [] = error "empty list"
myButLast [a] = error "single element list"
myButLast [a,b] = a
myButLast (x:xs) = myButLast xs
