-- defina funcoes
--
-- dobrar elementos de uma lista
double :: [Int] -> [Int]
double a = map (*  2) a
-- membership: se um elemento esta na lista
member :: [Int] -> Int -> Bool
member [] a = False
member (x:xs) a | x == a = True
                | otherwise = member xs a
-- filtragem: apenas os numeros de uma string
filterNum :: Char -> [Char]
filterNum a | elem a ['0'..'9'] = [a]
            | otherwise = ""

digits :: String -> String
digits [] = ""
digits (x:xs) = filterNum x ++ digits xs

-- somar elementos de duas listas
sumPairs :: [Int] -> [Int] -> [Int]
sumPairs [] b = b
sumPairs a [] = a
sumPairs (x:xs) (a:as) = x+a : sumPairs xs as
