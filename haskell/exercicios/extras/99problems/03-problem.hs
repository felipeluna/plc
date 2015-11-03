-- Find the K'th element of a list. The first element in the list is number 1.

elementAt :: [a] -> Int -> a
elementAt _ 0 = error "first element is 1"
elementAt (x:xs) 1 = x
elementAt (x:xs) index = elementAt xs (index-1)
