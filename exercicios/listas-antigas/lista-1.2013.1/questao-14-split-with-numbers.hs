-- 14) Crie uma função fSplitWith:: Eq a => [a] -> a -> Int -> [[a]] que
-- separe os itens do primeiro argumento utilizando o separador indicado no
-- segundo argumento. A função deverá então retornar uma lista contendo as
-- sublistas que foram separadas dessa maneira, e somente aquelas cujo
-- tamanho não excede o Int passado como parâmetro

split [] char = []
split (x:xs) char | x /= char = x: split xs
                  | otherwise = x
