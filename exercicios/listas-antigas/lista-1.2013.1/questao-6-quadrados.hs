-- Quantos quadrados diferentes existem em um quadriculado NxN(para N>=1)?
-- Crie uma função : : Int -> Int que responda essa pergunta.


quadrados :: Int -> Int
quadrados 0 = 0
quadrados 1 = 1
quadrados a = (a*a) + quadrados (a-1)
