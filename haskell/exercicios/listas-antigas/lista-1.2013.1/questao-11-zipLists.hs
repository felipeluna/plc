-- 11) Crie uma função zipLists que dada 3 listas de tipos quaisquer, gera
-- como retorno uma lista de tuplas com elementos de cada lista passada
-- como parâmetro.

zipList :: [a] -> [b] -> [c] -> [(a,b,c)]
zipList [] [] [] = []
zipList a [] [] = []
zipList [] b [] = []
zipList [] [] c = [] 
zipList (a:as) (b:bs) (c:cs) = (a,b,c) : zipList as bs cs
