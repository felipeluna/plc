-- ordenacao por insercao
inserir a [] = [a]
inserir a (x:xs) | a < x = a : (x:xs)
		   | otherwise = x : inserir a xs

-- ordenar uma lista existente com o inserir
ordinsercao [] = []
ordinsercao (x:xs) = inserir x (ordinsercao xs)

-- mergesort

--funcao merge

merge :: Ord a => [a] -> [a] -> [a]
merge [] b = b
merge a [] = a
merge (x:xs) (y:ys) = if x < y 
                      then x : merge xs (y:ys) 
		      else y : merge (x:xs) ys

