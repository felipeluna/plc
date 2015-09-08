split p [] = ([],[])
split p (x:xs) = if x < p then (x:left, right) else (left, x:right)
				where (left, right) = split p xs