module Main where
import Control.Parallel
import Control.Concurrent
import Control.Concurrent.MVar

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2) 

-- Dumb version where (fib n) is evaluated lazily.
--fibThread :: Int -> MVar Int -> IO ()
--fibThread n resMVar = putMVar resMVar (fib n)

-- Better version where (fib n) is evaluated eagerly.
fibThread :: Int -> MVar Int -> IO ()
fibThread n resMVar = pseq f (putMVar resMVar f)
                      where f = fib n
--fibThread n resMVar = putMVar resMVar (fib n)
  
mkList :: Int -> [Int]
mkList n = [1..n-1]

relprime :: Int -> Int -> Bool
relprime x y = (gcd x y == 1)

euler :: Int -> Int
euler n = length (filter (relprime n) (mkList n))

-- lazy evaluation gets in the way
--sumEuler :: [Int] -> Int
--sumEuler l = sum $ map euler l 

-- eager evaluation makes it all worth the effort
sumEuler :: [Int] -> Int
sumEuler l = pseq (forceList y) z
             where z = (sum y)  
                   y = map euler l

s1 :: Int
s1 = sumEuler (mkList 4750)

forceList [] = []
forceList (a:as) = pseq a (forceList as)

main :: IO ()
main
  = do putStrLn "explicit SumFibEuler"
       fibResult <- newEmptyMVar
       forkIO (fibThread 37 fibResult)
       pseq s1 (return ())
       f <- takeMVar fibResult
       putStrLn ("sum: " ++ show (s1+f))

