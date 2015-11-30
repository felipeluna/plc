-- Eliminate consecutive duplicates of list elements.

pack (x:xs) = (x:first) : pack rest
              where (first, rest) = span (==x) xs
pack [] = []
