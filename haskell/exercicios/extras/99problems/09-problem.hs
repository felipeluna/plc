-- Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.

-- Example:

-- * (pack '(a a a a b c c a a d e e e e))
-- ((A A A A) (B) (C C) (A A) (D) (E E E E))ack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.

-- Example:

-- * (pack '(a a a a b c c a a d e e e e))
-- ((A A A A) (B) (C C) (A A) (D) (E E E E))


pack1 acumulador [a] = acumulador ++ [a]
pack1 acumulador (x:xs) = pack1 acumulanovo xs
                         where acumulanovo = acumulador ++ [x]

pack [] = []
pack [a] = pack1 [] [a]
pack (x:y:xs) = if y == x then pack [x,y] 
