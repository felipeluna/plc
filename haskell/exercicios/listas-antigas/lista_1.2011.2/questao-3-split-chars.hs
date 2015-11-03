-- Defina uma funcao splitChars :: String -> (Uppercase, Lowercase, Int, Remainder) que lê uma String e retorna uma tupla com 4 elementos. Esses elementos são:
-- 1 - Uppercase: as letras maiúsculas da String, ignorando-se repetição.
-- 2 - Lowercase: as letras minúsculas da String, ignorando-se repetição.
-- 3 - Int: a soma dos dígitos que aparecem na String.
-- 4 - Remainder: os caracteres que não forem letras nem dígitos.
-- Represente Uppercase, Lowercase e Remainder através de tipos sinônimos de Haskell.
--
import Data.Char

type Uppercase = String
type Lowercase = String
type Remainder = String

removerRepetidas [] = []
removerRepetidas (x:xs) = x : [b | b <- removerRepetidas xs, b /= x]

removerUpperCase str = removerRepetidas $ [b | b <- str, elem b ['A'..'Z']]
removerLowerCase str = removerRepetidas $ [b | b <- str, elem b ['a'..'z']]
removerNumbers str = foldr (+) 0 $ map digitToInt $ [b|b <- str, elem b ['0'..'9']]
removerResto str = [b | b <- str, not (elem b ['A'..'Z']), not (elem b ['a'..'z']), not (elem b ['0'..'9'])]
splitChars :: String -> (Uppercase, Lowercase, Int, Remainder)
splitChars lista = (a,b,c,d)
                  where a = removerUpperCase lista
                        b = removerLowerCase lista
                        c = removerNumbers lista
                        d = removerResto lista

