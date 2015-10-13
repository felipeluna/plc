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
postsDeAmigosInteressantes amigos ((FaceBookPost a b c):hs) = if elem a amigos 
                                                              then (FaceBookPost  a b c) : postsDeAmigosInteressantes amigos hs
                                                              else postsDeAmigosInteressantes amigos hs

-- Questao 3
--
data Filtro = Author [Autor]
            | Text [Texto]
            | Not Filtro
            | And Filtro Filtro
            | Or Filtro Filtro




interp :: Filtro -> [FaceBookPost] -> [FaceBookPost]
interp (Author list) ((FaceBookPost b c d):xs) = if elem a list
                                                 then (FaceBookPost a b c) : interp list hs
                                                 else interp list hs
interp (Text list) ((FaceBookPost b c d):xs) = if elem b list
                                                 then (FaceBookPost a b c) : interp list hs
                                                 else interp list hs
interp (And filt1 filt2) a = interp filt1 a && interp filt2 a 
interp (Or filt1 filt2) a =  inter filt1  a || interp filt2 a
interp (Not filt1) a =  inter not filt1 a 

                                                
                                                 



