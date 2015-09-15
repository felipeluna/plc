-- 14) Crie uma função fSplitWith:: Eq a => [a] -> a -> Int -> [[a]] que
-- separe os itens do primeiro argumento utilizando o separador indicado no
-- segundo argumento. A função deverá então retornar uma lista contendo as
-- sublistas que foram separadas dessa maneira, e somente aquelas cujo
-- tamanho não excede o Int passado como parâmetro



step a x acc =
  if x == a
    then
      if null (fst acc)
        then acc
        else ([], (fst acc) : (snd acc))
    else (x : fst acc, snd acc)

words' xs a = foldr (step a) ([], []) xs

words2 (a,b) = if null a then b else a:b


final xs a = words2 $ words' xs a

fSplitWith str char num = [b | b <- final str char, length b <= num]
