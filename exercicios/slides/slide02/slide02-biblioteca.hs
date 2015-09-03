-- Exemplo: Biblioteca

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

baseExemplo :: BancoDados

baseExemplo = [
				("Sergio","O Senhor dos Aneis"),
				("Andre","Duna"),
				("Fernando","Jonathan Strange & Mr. Norrell"), 
				("Fernando","A Game of Thrones")
			  ]
			  

			  
-- funcoes sobre os bancos de dados - consultas
livros :: BancoDados -> Pessoa -> [Livro]
livros bd pe = [ snd b | b <- bd, fst b == pe]

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos bd li = [ fst b | b <- bd, snd b == li]

emprestado :: BancoDados -> Livro -> Bool
emprestado bd li = if length[b | b <- bd, snd b == li] > 0 then True else False

qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos bd pe = sum [ 1 | b <- bd, fst b == pe]

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar bd pe li = (pe, li) : bd

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver bd pe li = [b | b <- bd, b /= (pe,li)]