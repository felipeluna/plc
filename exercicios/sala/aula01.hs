-- uniao entre dois conjuntos

removeItem :: (Int,[Int]) -> [Int]
removeItem (a,[]) = []
removeItem (a,li)
            | a == head(li) = [] ++  removeItem (a,tail(li))
            | otherwise = head(li) : removeItem (a,tail(li))

union :: [Int] -> [Int] -> [Int]
union [] [] = []
union a [] = a
union [] b =    b
union (x:xs) (y:ys)
            | x == y = [x] ++ union (removeItem (x, xs)) (removeItem (x,(y:ys)))
            | otherwise = [x] ++ [y] ++
            union (removeItem(x,(removeItem(y,xs)))) (removeItem(y, removeItem(x, ys)))


-- intersecao entre dois conjuntos
intersect :: [Int] -> [Int] -> [Int]
intersect [] b = b
intersect a [] = a
intersect (x:xs) (y:ys)
            | x == xs = [x] + intersect xs ys
            | elem x ys 
