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

substring = isInfixOf

interp :: Eq a => Filtro -> [FaceBookPost a] -> [FaceBookPost a]
interp _ [] = []

interp f@(Author as) (p@(FaceBookPost a _ _):ps) =
    if elem a as
    then p : interp f ps
    else interp f ps

interp f@(Text ts) (p@(FaceBookPost _ t _):ps) =
    if isSubstring then p : interp f ps else interp f ps
    where isSubstring = foldr (||) False (map (substring t) ts)

interp f@(Not filterNot) (p:ps) =
    if elem p filtered
    then interp f ps
    else p : interp f ps
    where filtered = interp filterNot [p]

interp f@(And filter1 filter2) (p:ps) =
    if elem p filtered1 && elem p filtered2
    then p : interp f ps
    else interp f ps
    where filtered1 = interp filter1 [p]
          filtered2 = interp filter2 [p]

interp f@(Or filter1 filter2) (p:ps) =
    if elem p (filtered1 ++ filtered2)
    then p : interp f ps
    else interp f ps
    where filtered1 = interp filter1 [p]
          filtered2 = interp filter2 [p]
