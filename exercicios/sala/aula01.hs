-- uniao entre dois conjuntos
import Data.List

union :: [Int] -> [Int] -> [Int]
union [] [] = []
union a [] = a
union [] b = b

removeItem :: (Int,[Int]) -> [Int]
removeItem (a,[]) = []
removeItem (a,li) | a == head(li) = [] ++  removeItem (a,tail(li))
                  | otherwise = head(li) : removeItem (a,tail(li))


