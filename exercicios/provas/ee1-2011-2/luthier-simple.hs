import Data.List

-- Questao 2
--
type Autor = String
type Texto = String

data FaceBookPost obj = FaceBookPost Autor Texto [obj] 

instance Show obj => Show (FaceBookPost obj) where
    show (FaceBookPost a b c) = "Post: \n" ++ show a ++ "\n" ++ show b ++ "\n" ++  show c

instance Eq obj => Eq (FaceBookPost obj) where
    (FaceBookPost a b c) == (FaceBookPost d e f) = (a == d) && (b == e) && (c == f)

postsDeAmigosInteressantes :: [Autor] -> [FaceBookPost obj] -> [FaceBookPost obj]
postsDeAmigosInteressantes [] _ = []
postsDeAmigosInteressantes  _ [] = []
postsDeAmigosInteressantes amigos ((FaceBookPost a b c):hs) = 
    if elem a amigos 
    then (FaceBookPost  a b c) : postsDeAmigosInteressantes amigos hs
    else postsDeAmigosInteressantes amigos hs

-- Questao 3
--
data Filtro = Author [Autor]
            | Text [Texto]
            | Not Filtro
            | And Filtro Filtro
            | Or Filtro Filtro

substring = isInfixOf -- funcao predefinida em haskell que ve se uma string eh substring de outra. porem ele manda um [String].
                      -- por isso a funcao isSubstring

interp :: Eq a => Filtro -> [FaceBookPost a] -> [FaceBookPost a]
interp _ [] = []

interp (Author as) ((FaceBookPost a _ _):ps) =
    if elem a as
    then (FaceBookPost a _ _) : interp (Author as) ps
    else interp (Author as) ps

interp (Text ts) ((FaceBookPost _ t _):ps) =
    if isSubstring then (FaceBookPost _ t _) : interp (Text ts) ps else interp (Text ts) ps
    where isSubstring = foldr (||) False (map (substring t) ts)
    -- essa isSubstring se comporta como se fosse o `elem` que tava usando antes.
                                               
interp (Not filterNot) (p:ps) =
    if elem p filtered
    then interp (Not filterNot) ps
    else p : interp (Not filterNot) ps
    where filtered = interp filterNot (p:ps)

interp (And filter1 filter2) (p:ps) =
    if elem p filtered1 && elem p filtered2
    then p : interp (And filter1 filter2) ps
    else interp (And filter1 filter2) ps
    where filtered1 = interp filter1 (p:ps)
          filtered2 = interp filter2 (p:ps)

interp (Or filter1 filter2) (p:ps) =
    if elem p (filtered1 ++ filtered2)
    then p : interp (Or filter1 filter2)  ps
    else interp (Or filter1 filter2) ps
    where filtered1 = interp filter1 (p:ps)
          filtered2 = interp filter2 (p:ps)
