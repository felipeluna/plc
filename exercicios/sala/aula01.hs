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

-- a = [1,2,3,4,5,1,2,1]
-- b = [1,9,4,5,3,2,1,7]
intersect :: [Int] -> [Int] -> [Int]
intersect [] b = []
intersect a [] = []
intersect (x:xs) b
            | elem x b = x : intersect (removeItem(x,xs)) (removeItem(x,b))
            | otherwise = intersect xs b
