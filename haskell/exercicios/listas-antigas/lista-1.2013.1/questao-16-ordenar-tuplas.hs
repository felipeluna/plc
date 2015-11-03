ordenarTuplas :: [(Char, Int)] -> Int -> [(Char, Int)]
ordenarTuplas [] _ = []
ordenarTuplas ((a,b):xs) c | c == 0 = ordenarTuplas leftZero 0 ++ [(a,b)] ++ ordenarTuplas rightZero 0
		           | c == 1 = ordenarTuplas leftOne 1 ++ [(a,b)] ++ ordenarTuplas rightOne 1
			   where leftZero = [d | d <- xs, fst d < a]
                                 rightZero = [d | d <- xs, fst d >= a]
                                 leftOne = [d | d <- xs, snd d < b]
				 rightOne = [d | d <- xs, snd d >= b] 

