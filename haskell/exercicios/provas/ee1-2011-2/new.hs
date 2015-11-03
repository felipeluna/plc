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


