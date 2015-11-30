-- Eliminate consecutive duplicates of list elements.

pack (x:xs) = (x:first) : pack rest
              where (first, rest) = span (==x) xs
pack [] = []

encode a = map (\x -> (length x, head x)) $ pack a
