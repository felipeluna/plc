-- 10) Crie uma função que receba uma lista e uma função e ordenação
-- e retorne a lista ordenada.

ordenacaoStr :: String -> String -> Bool
ordenacaoStr "" "" = False
ordenacaoStr x "" = False
ordenacaoStr "" y = True
ordenacaoStr (x:xs) (y:ys) | x == y = ordenacaoStr xs ys
                           | x > y = False
                           | x < y = True

ordStr a b | ordenacaoStr a b == True = a ++ b
           | otherwise = b ++ a 

sortBy [] f = []
sortBy (x:y:xs) f = f x y : sortBy xs f
