-- crie uma função que, dado um número Inteiro positivo x, verifique se x é primo ou não.
-- lembre-se de utilizar o crivo de eratóstenes para deixar a sua função mais otimizada

existe a [] = False
existe a (x:xs) | a == x = True
				| otherwise = existe a xs

erasto :: [Int] -> [Int]
erasto [] = []
erasto (x:xs) = x : erasto novo
				where novo = [b | b <- xs, mod b x /= 0]

ehprimo :: Int -> Bool
-- ehprimo -a = error "apenas numeros positivos"
ehprimo 0 = False
ehprimo 1 = False
ehprimo a = existe a (erasto [2..a])


