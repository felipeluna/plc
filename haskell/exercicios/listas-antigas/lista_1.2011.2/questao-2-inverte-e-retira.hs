-- Crie uma função que, dados uma lista de String e um padrão (uma String), retorne todos os elementos da lista com suas letras trocadas (maiúsculas por minúsculas e vice-versa) e na ordem inversa, menos o padrão. Obs.: É proibido usar a função reverse.
-- 
import Data.Char

meuReverse [] = []
meuReverse lista = (last lista) : meuReverse (init lista)

remover lista a = [b | b <- lista, b /= a]

inverterChar c | elem c ['A'..'Z'] = chr $ (fromEnum c + 32)
               | elem c ['a'..'z'] = chr $ ((fromEnum c) - 32)
               | otherwise = error "error" 

inverterString a = map inverterChar a

inverterLista a = map inverterString a
inverteRetira lista b = inverterLista $ meuReverse $ remover lista b
