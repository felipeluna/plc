
sumDigits :: Int -> Int
sumDigits a = (div a 10) + (mod a 10)

sumDigitsTupla :: Int -> (Int, Int)
sumDigitsTupla a = (a,sumDigits(a))

sortTupla :: [(Int, Int)] -> [Int]
sortTupla [] = []

