ordenaTres :: Int -> Int -> Int -> [Int]
ordenaTres x y z = [x,y,z]

listToTripla :: [Int] -> (Int, Int, Int)
listToTripla [x,y,z] = (x,y,z)

sort :: [Int] -> [Int]
sort [] = []
sort (x:xs) = sort [b| b <- xs, b < x] ++ [x] ++ sort [b | b <- xs, b >= x]

ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (x,y,z) = listToTripla $ sort $ ordenaTres x y z