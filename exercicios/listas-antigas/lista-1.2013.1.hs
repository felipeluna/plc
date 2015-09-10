-- Crie uma função que, dados dois números x e y, 
-- retorne como resultado o m.d.c. de x e y.

mdc :: Integral a => a -> a -> a
mdc a 0 = a
mdc a b | a > b = mdc b (mod a b)
		| otherwise = mdc a (mod b a)
		
-- Crie uma função que, dado um número inteiro positivo x, verifique se x é primo ou não.
-- Lembre-se de utilizar o crivo de Eratóstenes para deixar a sua função mais otimizada

existe a [] = False
existe a (x:xs) | a == x = True
				| otherwise = existe a xs

erasto :: [Int] -> [Int]
erasto [] = []
erasto (x:xs) = x : erasto novo
				where novo = [b | b <- xs, mod b x /= 0]

ehPrimo :: Int -> Bool
ehPrimo -a = error "Apenas numeros positivos"
ehPrimo 0 = False
ehPrimo 1 = False
ehPrimo a = existe a (erasto [2..a])

-- Dados dois pontos num espaço tridimensional, faça uma função distância e um tipo ponto 
-- de tal forma que a função calcule a distância entre dois pontos passados como 
-- parâmetros e tenha a assinatura:

type Ponto = (Double, Double, Double)

distancia :: Ponto -> Ponto -> Double
distancia (a,b,c)(d,e,f) = sqrt (((a-d)**2) + ((b-e)**2) + ((c-f)**2))