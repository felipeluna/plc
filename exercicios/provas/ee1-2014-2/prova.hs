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


-- questao 2
-- estudar instance 

instance Eq Valor where
	 (Num a) == (Num b) = a == b
	 (Bool a) == (Bool b) = a == b
	 Erro == Erro = True
	 (Fun a) == (Fun b) = a == b -- duvida
         _==_ = False -- duvida

-- questao 3

data ExpB = V | F | NEG ExpB | OU ExpB ExpB | VarB Id | AplB Operador ExpI
data ExpI = Lit Int | VarI Id | Apl Operador ExpI

type Operador = String
type Id = String

data Comando =    Atribuicao Id ExpI
		| Condicional ExpB Comando Comando 
                | While ExpB Comando
 		| Composicao Comando Comando	

     

