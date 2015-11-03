
-- BASICS

-- implementar concatenacao (++)

conc :: [a] -> [a] -> [a]
conc [] l = l
conc (x:xs) l = x : conc xs l

-- implementar head (devolver cabeca da lista)

headd :: [a] -> a
headd [a] = a
headd (x:xs) = x

-- implementar tail (retorna lista sem cabeca)

taill :: [a] -> [a]
taill [a] = []
taill (x:xs) = xs

-- implementar last (retorna ultimo elemento da lista

lastt :: [a] -> a
lastt [a] = a
lastt (x:xs) = lastt xs

-- implementar init (retorna toda a lista menos o ultimo numero)

initt :: [a] -> [a]
initt [a] = []
initt (x:xs) = x : initt xs

-- implementar lenght (retorna o comprimento da lista)

lenn :: [a] -> Int
lenn [] = 0
lenn (x:xs) = 1 + lenn xs

-- implement (!!) index (retorna o numero do indice)
indexx :: [a] -> Int -> a
indexx [a] 0 = a
indexx (x:xs) i = indexx xs (i-1)  


