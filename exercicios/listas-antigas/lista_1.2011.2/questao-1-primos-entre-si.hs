-- Crie uma função que, dada uma lista de inteiros e um inteiro qualquer, retorne todos os inteiros que não são divisíveis por esse inteiro passado como parâmetro.
--


primoEntreSi :: Int -> Int -> Bool
primoEntreSi a b = if mod a b == 0 then False else True

primosEntreSi lista a = [b | b <- lista, primoEntreSi b a]
