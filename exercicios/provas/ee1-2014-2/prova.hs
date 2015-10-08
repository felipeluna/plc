-- questao 1


-- lista = [("fat", Fun fatorial), (">0", Fun maior0),("+2", Fun adiciona2)]
data Valor =  Num Int
	    | Bool Bool
            | Erro
            | Fun (Valor -> Valor)


overwrite :: (String, Valor) -> [(String, Valor)] -> [(String, Valor)]
overwrite (s,v) ((ss,vv):xs) = (s,v) : [b| b <- ((ss,vv):xs), ss /= s]

lookupp :: String -> [(String, Valor)] -> Valor
lookupp s [] = Erro
lookupp s ((ss,vv):xs) = if s == ss then vv else lookupp s xs


