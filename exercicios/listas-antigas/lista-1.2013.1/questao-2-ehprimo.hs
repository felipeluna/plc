-- crie uma função que, dado um número inteiro positivo x, verifique se x é primo ou não.
-- lembre-se de utilizar o crivo de eratóstenes para deixar a sua função mais otimizada

existe a [] = false
existe a (x:xs) | a == x = true
				| otherwise = existe a xs

erasto :: [int] -> [int]
erasto [] = []
erasto (x:xs) = x : erasto novo
				where novo = [b | b <- xs, mod b x /= 0]

ehprimo :: int -> bool
-- ehprimo -a = error "apenas numeros positivos"
ehprimo 0 = false
ehprimo 1 = false
    ehprimo a = existe a (erasto [2..a])


