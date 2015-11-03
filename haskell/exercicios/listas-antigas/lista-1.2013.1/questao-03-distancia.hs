-- Dados dois pontos num espaço tridimensional, faça uma função distância e um tipo ponto 
-- de tal forma que a função calcule a distância entre dois pontos passados como 
-- parâmetros e tenha a assinatura:

type Ponto = (Double, Double, Double)

distancia :: Ponto -> Ponto -> Double
distancia(a,b,c)(d,e,f) = sqrt (((a-d)**2) + ((b-e)**2) + ((c-f)**2))
