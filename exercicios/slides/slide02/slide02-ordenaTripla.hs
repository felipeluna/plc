-- transforma tres numeros numa lista (mudar nome da funcao)
numsToList :: Int -> Int -> Int -> [Int]
numsToList x y z = [x,y,z]

-- transforma lista em tripla
listToTripla :: [Int] -> (Int, Int, Int)
listToTripla [x,y,z] = (x,y,z)

sort :: [Int] -> [Int]
sort [] = []
sort (x:xs) = sort [b| b <- xs, b < x] ++ [x] ++ sort [b | b <- xs, b >= x]

ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (x,y,z) = listToTripla $ sort $ numsToList x y z
