foldr' op id [] = id
foldr' op id (x:xs) = op x (foldr' op id xs)

-- media com acumuladores
media s t [] = s/t
media s t (x:xs) = media (s + x) (t + 1) xs

-- sum com acumuladores
sum' a [] = a
sum' a (x:xs) = sum' (a+x) xs

-- product com acumuladores
product' a [] = a
product' a (x:xs) = product' (a*x) xs


-- media com acumuladores


summ (a,b) [] = (a,b)
summ (a,b) (x:xs) = summ ((a+x),(b+1)) xs


med l = s/t
	where (s,t) =  summ (0,0) l	

-- media com foldr

summ' 0 (a,b) = (a, b)
summ' x (a,b) = (a+x, b+1)

medd' l = s/t
	where (s,t) = foldr summ' (0,0) l

-- media com lambda

medd l = s/t
	where (s,t) = foldr (\x (s,t)-> (s+x,t+1)) (0,0) l



-- composicao de funcoes

inc x = x + 1
dec x = x - 1

entidade x = (inc . dec) x





