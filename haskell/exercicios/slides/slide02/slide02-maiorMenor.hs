-- Defina a função menorMaior que recebe
-- três inteiros e retorna uma tupla com o 
-- menor e o maior deles
--

max' :: Int -> Int -> Int
max' a b = if a > b then a else b

min' :: Int -> Int -> Int
min' a b = if a < b then a else b

menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior a b c = ((min' a $ min' b c), (max' a $ max' b c)) 

--ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
--ordenaTripla (a,b,c) = (min
