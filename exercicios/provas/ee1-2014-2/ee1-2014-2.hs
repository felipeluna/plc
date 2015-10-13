-- questao 1


-- lista = [("fat", Fun fatorial), (">0", Fun maior0),("+2", Fun adiciona2)]
data Valor = Num Int
	       | Bool Bool
           | Erro
           | Fun (Valor -> Valor)


overwrite :: (String, Valor) -> [(String, Valor)] -> [(String, Valor)]
overwrite (s,v) ((ss,vv):xs) = (s,v) : [b | b <- ((ss,vv):xs), ss /= s]

lookupp :: String -> [(String, Valor)] -> Valor
lookupp s [] = Erro
lookupp s ((ss,vv):xs) = if s == ss then vv else lookupp s xs


-- questao 2
-- estudar instance

instance Eq Valor where
	 (Num a) == (Num b) = a == b
	 (Bool a) == (Bool b) = a == b
	 Erro == Erro = True
     _ == _ = False -- duvida

-- questao 3

data ExpB = V | F | NEG ExpB | OU ExpB ExpB | VarB Id | AplB Operador ExpI
data ExpI = Lit Int | VarI Id | Apl Operador ExpI

type Operador = String
type Id = String

data Comando = Atribuicao Id ExpI
		     | Condicional ExpB Comando Comando
             | While ExpB Comando
 		     | Composicao Comando Comando

-- questao 4
intEB :: [(Operador, Valor)] -> ExpB -> [(String, Valor)] -> Valor 

intEI :: [(Operador, Valor)] -> ExpI -> [(String, Valor)] -> Valor
intEI estado (Lit a) memoria = Num a
intEI estado (VarI id) memoria = lookup id memoria
intEI estado (Apl op expi) memoria = overwrite (op,novo) where novo = intEI estado
                            
        

int :: Comando -> [(Operador, Valor)] -> [(Operador, Valor)] -> (Valor, [(String, Valor)])

int (Atribuicao id exp) estado memoria = (novo, overwrite (id, novo) memoria) 
                                         where novo = intEI memoria exp estado

int (Condicional expb cmnd1 cmdn2) estado memoria = if b == True then int cmnd1 estado memoria else int cmnd2 estado memoria
                                                    where (Bool b) = intEB estado expb memoriaestado memoria

int (While expb cmnd) estado memoria = if b == True then int (While expb cmnd) estado memorianova else (Num 0, memoria)
                                       where (Bool b) = intEB estado expb memoria 
                                             (val,memorianova) = int cmnd estado memoria

int (Composicao cmnd1 cmnd2) estado memoria = int cmnd2 estado memorianova
                                            where (_, memorianova) = int cmdn1 estado memoria
