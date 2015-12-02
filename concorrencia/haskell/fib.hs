import Control.Parallel
import System.Time

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2) 

mkList :: Int -> [Int]
mkList n = [1..n-1]

relprime :: Int -> Int -> Bool
relprime x y = (gcd x y == 1)

euler :: Int -> Int
euler n = length (filter (relprime n) (mkList n))

sumEuler :: Int -> Int
sumEuler n = (sum.(map euler).mkList) n

parSumFibEuler :: Int->Int->Int
parSumFibEuler a b = (f+e)  
        where f = fib a
              e = sumEuler b

r1 :: Int
r1 = parSumFibEuler 37 4750

-- Determines the elapsed time between two instants.
secDiff :: ClockTime -> ClockTime -> Float
secDiff (TOD secs1 psecs1) (TOD secs2 psecs2) 
    = fromInteger(psecs2 - psecs1)/1e12 + fromInteger(secs2 - secs1)
    
main::IO() 
main = do pseq r1 (return ())
          putStrLn("sum: " ++ show r1)
--          putStrLn("time: " ++ show (secDiff t0 t1) ++ " seconds")
