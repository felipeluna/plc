-- Use a list comprehension to define a function neglist xs that computes the number of negative elements in a list xs.
--
-- negList :: [Int] -> Int

negList n = [1 | a <- n, a < 0]

-- In Haskell, there is a pre-defined function replicate :: Int -> a -> [a]. When called with the arguments n ≥ 0 and e, it returns a list of length n which contains only elements with value e. For example replicate 3 ’c’ returns the string "ccc". Implement the function repl :: Int -> a -> [a], which should do the same as the function replicate, but define it using only one defining equation and only a list comprehension as its right-hand side. You may use the shorthand notation [a..b], which returns a list of all integers from a to b, but you may not use replicate in your implementation of repl.
--

repl :: Int -> a -> [a]
repl times a = [a | b <- [1..times]]

-- Write a function allStrings :: [Char] -> Int -> [String], such that allStrings s n returns a list of all non-empty strings consisting only of characters from the list s and which have at most length n. The order in which the strings are returned is not important. For example allStrings "ab" 2 might return ["a","aa","ab","b","ba","bb"]. You may use up to two defining equations, but one right-hand side must be a list comprehension.
--
allStrings :: [Char] -> Int -> [String]
allStrings [] _ = []
allStrings word limit = [b <- [], length(b) <= limit]

