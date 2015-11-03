-- crie uma função que, dados dois números x e y, 
-- retorne como resultado o m.d.c. de x e y.

mdc :: integral a => a -> a -> a
mdc a 0 = a
mdc a b | a > b = mdc b (mod a b)
		| otherwise = mdc a (mod b a)
	
