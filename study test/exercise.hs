-- pattern matching

is_zero :: Int -> Bool
is_zero 0 = True
is_zero _ = False 

fac :: Integer -> Integer
fac n = aux n 1 
    where 
        aux n acc 
            | n <= 1    = acc
            | otherwise = aux (n - 1) (n * acc) 

-- Lista so permite um tipo

-- construtores
-- []
-- x:xs 

asc :: Int -> Int -> [Int]
asc n m 
  | m < n     = []
  | m == n    = [m]
  | otherwise = n : asc (n + 1) m