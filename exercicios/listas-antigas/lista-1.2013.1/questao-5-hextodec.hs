--  Desenvolva uma função palindromoDecimal :: String -> String que, recebendo um número inteiro positivo N em hexadecimal (representado como um String), seja capaz de verificar se este número, transformado para a base decimal, é lido exatamente da mesma forma de frente para trás ou de trás para frente, ou seja, se este número na base decimal é um palíndromo.
-- Obs.: Não é permitido o uso da função reverse.

import Data.Char

numbers = ['1'..'9']
letters = ['A'..'F']

charToNum :: Char -> Int
charToNum a | elem a numbers = ord a - 48
            | elem a letters = ord a - 55
            | otherwise = error "not a valid Hex number"

hexToNum :: [Int] -> Int
hexToNum [] = 0
hexToNum (x:xs) = x * (16 ^ (length xs)) + hexToNum xs

hexToDec :: String -> String
hexToDec str = show $ hexToNum $ map charToNum str

isPalindrome :: String -> Bool
isPalindrome [] = True
isPalindrome [a] = True
isPalindrome (x:xs) | x == last xs = isPalindrome $ init xs
                    | otherwise = False

palindromoDecimal :: String -> String
palindromoDecimal hex | isPalindrome $ resultado = resultado ++ " - PALINDROMO"
                      | otherwise = resultado ++ " - NAO-PALINDROMO"
                      where resultado = hexToDec hex 

