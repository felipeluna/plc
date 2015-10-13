-- questao 1
type Chave = String
type Valor = Int
add :: (Chave, Valor) -> [(Chave,Valor)] -> [(Chave, Valor)]
add (a,v) [] = [(a,v)]
add (a,v) ((i,j):hs) = (a,v) : [b | b <- ((i,j):hs), i /= a]

getChave :: (Chave, Valor) -> Chave
getChave (cha,val) = cha

domain :: [(Chave, Valor)] -> [Chave]
domain [] = []
domain m = map getChave m

getValor :: (Chave, Valor) -> Valor
getValor (a,b) = b

imagem :: [(Chave, Valor)] -> [Valor]
imagem [] = []
imagem m = map getValor m

apply :: Chave -> [(Chave, Valor)] -> Maybe Valor
apply c [] = Nothing
apply c ((a,b):hs) = if c == a then Just b else apply c hs
-- questao 2
--
{-
type Id = String

data Listas = Lista Id [Int] -- listas constantes
            | Atribuicao Id Listas -- atribuicoes 
            | Variavel Id
            | Composicao Listas Listas
            | Compressao Expressao Id Listas Predicado 
-}
{-
avaliar :: Listas -> [(String, Listas)] -> (Maybe [Int], [(String, Listas)])
avaliar (Lista []) memoria = (Nothing, memoria)
avaliar (Lista id [a] memoria = ([a], (id, (Lista id [a]):memoria))
avaliar (Atribuicao id l) memoria = 
-}
