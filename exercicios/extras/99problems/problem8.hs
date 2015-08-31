-- Eliminate consecutive duplicates of list elements.

compress :: Eq a => [a] -> [a]
compress [] = []
compress [a] = [a]
compress (x:y:xs)  | x == y = compress(y:xs)
                   | otherwise  = x : compress(y:xs)
