count :: [Char] -> Int -> Bool
count [] a = if a == 0 then True else False
count (x:xs) pilha | x == '(' = count xs (pilha + 1) 
		   | x == ')' = count xs (pilha - 1) 
		   | otherwise = count xs pilha 
