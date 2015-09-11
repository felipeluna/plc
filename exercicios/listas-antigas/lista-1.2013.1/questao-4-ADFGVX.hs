-- Simule a cifra ADFGVX. Para isto, crie a função cifraMessage :: String
-- -> String -> String, sendo os parâmetros a mensagem a ser enviada
-- e a chave para encriptação nessa ordem. O retorno é a mensagem
-- criptografada. Utilize a seguinte tabela como Quadrado de Políbio:
-- table = [('a', "n478rp"), ('d', "1cekml"), ('f', "ht6u0j"), ('g',
-- "d52asx"), ('v', "ziqovb"), ('x', "3y9fwg")]
-- Para melhor compreensão de table:
-- O char ‘p’ é criptografado para “xa”, pois ‘p’ é o último char de
-- "n478rp" e a chave é o char ‘a’.


table = [('a', "n478rp"), ('d', "1cekml"), ('f', "ht6u0j"), 
          ('g',"d52asx"), ('v', "ziqovb"), ('x', "3y9fwg")]

existe :: Eq a => a -> [a] -> Bool
existe a [] = False
existe a (x:xs) | a == x = True
                | otherwise = existe a xs

position :: Char -> [Char] -> Int
position a [] = 0
position a (x:xs) | a == x = 1
                  | otherwise = 1 + position a xs
                  
pos :: Char -> [Char] -> Char
pos a b | existe a b = "adfgvx" !! ((position a b) - 1)
        | otherwise = '0'

procurarTable :: [(Char, [Char])] -> Char -> [(Char, Char)]
procurarTable [] a = []
procurarTable ((c, l):t) a = (pos a l, c) : procurarTable t a

removerLixo :: [(Char, Char)] -> [(Char, Char)]
removerLixo [] = []
removerLixo ((c, d):l) | c == '0' = removerLixo l
                        | otherwise = (c,d): removerLixo l

encryptChar a = removerLixo $ procurarTable table a
