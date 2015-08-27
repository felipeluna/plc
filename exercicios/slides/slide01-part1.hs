-- calcular quantas vezes as vendas de um dia foram iguais a um numero s.
vendas :: Int -> Int
vendas x = mod 10001 (x+1)

check :: Int -> Int -> Int
check s n 
        | vendas n == s = 1
        | otherwise = 0
        
soma :: Int -> Int -> Int
soma s n 
        | n == 0 = check s 0
        | otherwise = (soma s (n-1)) + check s n
