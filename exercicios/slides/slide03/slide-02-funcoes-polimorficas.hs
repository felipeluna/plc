-- defina as seguintes funcoes


-- take : devolve uma lista com os N primeiros elementos da lista de
-- entrada
--
take' :: Int -> [a] -> [a]
take' a [] = []
take' 1 (x:xs) = [x]
take' a (x:xs) = [x] ++ take' (a-1) xs


-- drop : devolve uma lista contendo os elementos da lista de entrada,
-- exceto pelos N primeiros
--
drop' :: Int -> [a] -> [a]
drop' a [] = []
drop' 0 a = a
drop' 1 (x:xs) = xs
drop' a (x:xs) = drop (a-1) xs

takeWhile' a [] = []
takeWhile' a (x:xs) | a x == True = x : takeWhile' a xs
                    | otherwise = takeWhile' a []

