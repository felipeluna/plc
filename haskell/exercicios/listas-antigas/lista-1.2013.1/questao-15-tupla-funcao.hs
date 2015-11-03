-- 15) Dada uma lista de tuplas formadas por um Double x e uma função
-- unária f que retorna um
-- ￼Double, crie uma função retorne uma lista de reais, sendo cada um deles
-- o resultado de f(x).
-- Obs: É obrigatório o uso da função map da biblioteca padrão de haskell.
--

funcaoTupla (a, b) = b a
aplicaFuncoes a = map funcaoTupla a
