-- Você está coletando informações do Facebook para seu novo app e deseja
-- filtrar os usuários de acordo com o gênero e a idade. As informações
-- sempre vem em uma lista de tuplas (String username, Char gender, Int
-- age). Utilizando compreensão de listas, liste o nome de todos usuários
-- do sexo masculino com idade a partir de 18 anos. Note que o Char gender
-- pode assumir apenas os valores 'F' ou 'M'.
--

getAge (a,b,c) = c
getGender (a,b,c) = b
tuplaFilter ((a,b,c):xs) = [d | d <- ((a,b,c):xs), getAge d >= 18, getGender d == 'M']

returnName (a,b,c) = a

fbfilter a = map returnName $ tuplaFilter a
