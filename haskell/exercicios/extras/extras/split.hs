split p [] = ([],[])
split p (x:xs) = if x < p then (x:left, right) else (left, x:right)
				where (left, right) = split p xs
				
eqsort [] = []
eqsort (x:xs) = eqsort left ++ [x] ++ eqsort right
				where (left, right) = split x xs
				
				
				
				