-- 9) Crie uma função de assinatura frequencia :: String -> [Char] ->
-- [(Char,Int)]. Esta função receberá uma String, e uma lista de Char’s.
-- O retorno será uma lista de tuplas indicando o número de ocorrências na
-- String de cada Char da lista recebida como parâmentro. Os primeiros
-- elementos das tuplas serão os Char’s da lista e os segundos elementos
-- serão as ocorrências dos respectivos Char`s na String. A lista deverá
-- ser ordenada em função do número de ocorrências, e caso
-- este seja igual, em ordem alfabética.

freq :: String -> Char -> Int
freq [] a = 0
freq (x:xs) a | x == a = 1 + freq xs a
              | otherwise = freq xs a
             
freq2 :: String -> Char -> (Char, Int)
freq2 str a = (a, freq str a)

frequencia :: String -> [Char] -> [(Char,Int)]
frequencia str chars = ordTupla $ map (freq2 str) chars

ordTupla :: [(Char, Int)] -> [(Char, Int)]
ordTupla [] = []
ordTupla ((a, b):xs)  = ordTupla left ++ ordTupla leftIgual ++ [(a,b)] ++ ordTupla rightIgual ++ ordTupla right
                        where left = [c | c <- xs, snd c >  b]
                              leftIgual = [c | c <- xs, snd c == b, fst c <  a]
                              rightIgual = [c | c <- xs, snd c == b, fst c >  a]
                              right = [c | c <- xs, snd c <  b]

