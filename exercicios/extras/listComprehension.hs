-- Use a list comprehension to define a function neglist xs that computes the number of negative elements in a list xs.
--
--negList :: [Int] -> Int
negList n = [1 | a <- n, a < 0]

-- replicate functino with list comprehension
repl :: Int -> a -> [a]
repl times a = [a | b <- [1..times]]
