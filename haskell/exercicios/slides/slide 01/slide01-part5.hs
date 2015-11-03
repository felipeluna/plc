-- Implemente uma função que, dado um número inteiro N, retorne uma lista de inteiros com os N primeiros  números pares da sequência de Fibonacci.
--

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci a = fibonacci(a-2) + fibonacci (a -1)

fibonacciList :: Int -> [Int]
fibonacciList a = map fibonacci [0..a]

