-- 12) Implemente uma versão otimizada do algoritmo Quicksort que não
-- precisa passar pela lista de elementos de entrada duas vezes para cada
-- chamada recursiva, diferentemente do que é feito na versão apresentada
-- em sala de aula. Seu quicksort deve funcionar para listas de tipos cujos
-- valores possam ser comparados para saber se um é maior que o outro.

-- split
split p [] = ([],[])
split p (x:xs) = if x < p then (x:left, right) else (left, x:right)
                 where (left, right) = split p xs

qsort [] = []
qsort (x:xs) = qsort left ++ [x] ++ qsort right
               where (left, right) = split x xs
