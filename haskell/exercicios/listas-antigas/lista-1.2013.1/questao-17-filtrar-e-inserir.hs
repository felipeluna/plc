 -- ￼17) Implemente a função filtrarEInserir :: [[Int]] -> Int -> ([[Int]], Int) que retorna uma tupla. O primeiro elemento da tupla são listas de inteiros tais que a soma dos números ímpares é maior que a soma dos números pares. O segundo elemento consiste no produto entre o segundo argumento da função filtrarInserir e a multiplicação da maior soma obtida das listas retornadas. Utilize obrigatoriamente filter.


oddSum :: [Int] -> Bool
oddSum [] = False
oddSum a = (foldr(+) 0 b) > (foldr (+) 0 c)
           where b = filter odd a
                 c = filter even a

-- filtrarEInserir :: [[Int]] -> Int -> ([Int],Int)
filtrarEInserir a b = (filter oddSum a, (maximum $ map (foldr (+) 0) (filter oddSum a) * b))
