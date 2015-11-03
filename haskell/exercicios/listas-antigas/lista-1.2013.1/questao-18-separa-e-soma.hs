separaEsoma [] = (0,0)
separaEsoma lista = (foldr1 (+) par, foldr1 (+) impar)
                     where par = filter even lista
                           impar = filter odd lista
                           
separaEsoma2 [] = (0,0)
separaEsoma2 lista = (foldr1 (+) par, foldr1 (+) impar)
                     where (par, impar) = separar lista 

separaEsoma3 [] = (0,0)
separaEsoma3 lista = (foldr1 (+) par, foldr1 (+) impar)
                     where (par, impar) = separar2 lista ([],[])
                           
-- separar primeira maneira					 
separar [] = ([],[])
separar (x:xs) = if even x then (x:left, right) else (left, x:right)
				 where (left, right) = separar xs

-- separar com acumulador				 
separar2 [] (a,b) = (a,b)
separar2 (x:xs) (a,b) = if even x then separar2 xs (x:a,b) else separar2 xs (a, x:b) 