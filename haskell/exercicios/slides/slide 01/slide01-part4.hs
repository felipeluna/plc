
-- Crie um função que recebe uma lista de inteiros e
-- retorna a lista ordenada em função da soma de seus 
-- digitos(crescente):
sumDigits :: Int -> Int
sumDigits a = (div a 10) + (mod a 10)

sumDigitsTupla :: Int -> (Int, Int)
sumDigitsTupla a = (a,sumDigits(a))


sortTupla :: [(Int, Int)] -> [(Int, Int)]
sortTupla [] = []
sortTupla (x:xs) =  sortTupla [b | b <- xs, snd(b) < snd(x)] ++ [x] ++ sortTupla[b | b <- xs, snd(b) >= snd(x)]

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar a = map fst $ sortTupla $ map sumDigitsTupla a
