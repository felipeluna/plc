-- 2) Faça uma função func1 :: a->String->(String->Bool)->(a,String), que simplesmente devolve o par formado pelo seu primeiro argumento e o segundo caso o segundo argumento aplicado ao terceiro seja verdadeiro e devolva (a,””) caso contrário.
-- Então faça uma func2 :: [String->e]->[String]->[String->Bool]->[e], que aplique cada elemento da lista em seu primeiro argumento a func1. Então monte uma lista com todas as possibilidades de aplicar seu segundo e terceiro argumento à lista de funções parciais encontrada no primeiro passo. Com essa lista em mãos, use obrigatoriamente a função map sobre ela e obtenha [e].
--
--
func1 :: a->String->(String->Bool)->(a,String)
func1 a b c | c a  True = (a,b)
            | otherwise = (a,"")

-- func2 :: [String->e]->[String]->[String->Bool]->[e]
-- func2 a = map (func1 a) a
--
