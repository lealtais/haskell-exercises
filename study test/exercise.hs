module Main where

import Prelude hiding (elem, nub)
import Data.List hiding (elem, nub)

-- Pattern matching
is_zero :: Int -> Bool
is_zero 0 = True
is_zero _ = False

fac :: Int -> Int
fac n = aux n 1
  where
    aux 0 acc = acc
    aux n acc = aux (n - 1) (n * acc)

-- Listas
asc :: Int -> Int -> [Int]
asc n m
  | m < n = []
  | m == n = [m]
  | m > n = n : asc (n + 1) m

head' :: [a] -> a
head' (x:_) = x

tail' :: [a] -> [a]
tail' (_:xs) = xs

null' :: [a] -> Bool
null' [] = True
null' _ = False

and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs

or' :: [Bool] -> Bool
or' [] = False
or' (x:xs) = x || or' xs

-- List comprehension
listComp :: [Int]
listComp = [2 * x | x <- [1, 2, 3]]

sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

evens :: [Int] -> [Int]
evens [] = []
evens (x:xs)
  | even x = x : evens xs
  | otherwise = evens xs

-- Tuples
fst' :: (a, b) -> a
fst' (x, _) = x

snd' :: (a, b) -> b
snd' (_, y) = y

addTuples :: [(Int, Int)] -> [Int]
addTuples xs = [x + y | (x, y) <- xs]

main :: IO ()
main = do
  print (is_zero 0)
  print (fac 5)
  print (asc 1 5)
  print (head' [1, 2, 3, 4, 5])
  print (tail' [1, 2, 3, 4, 5])
  print (null' [1, 2, 3, 4, 5])
  print (and' [True, False, True])
  print (or' [True, False, True])
  print listComp
  print (sumList [1, 2, 3, 4])
  print (evens [1, 2, 3, 4, 5, 6])
  print (fst' (1, 2))
  print (snd' (1, 2))
  print (addTuples [(1, 2), (2, 3), (100, 100)])

-- se tiver tal emeleneta na lista devolva true 
elem :: Eq a => a -> [a] -> Bool
elem _ [] = False
elem n (x:xs)
  | n == x = True
  | otherwise = elem n xs

-- removendo duplicata 
nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:xs)
  | x `elem` xs = nub xs --se ele ja eh um elemnto da lista, entao chama a funcao recursivamente sem ele 
  | otherwise = x : nub xs --se ele nao eh um elemento da lista, entao adiciona ele na lista e chama a funcao recursivamente sem ele

-- se ta em ordem crescente 
isAsc :: [Int] -> Bool
isAsc [] = True --uma lista vazia eh considerada crescente
isAsc [x] = True --uma lista com um elemento eh considerada crescente
isAsc (x:y:xs) -- uma lista com dois ou mais elementos
  | x <= y = isAsc (y:xs) -- se o primeiro elemento for menor ou igual ao segundo, chama a funcao recursivamente com o segundo elemento e o resto da lista
  | otherwise = False 


-- caminho de um nó para outro
-- representa arestas do tipo (origem, destino)
-- Exemplo: [(1,2), (2,3), (3,4)] significa 1 -> 2 -> 3 -> 4
-- A função responde: existe algum caminho de x até y?
--
-- 1 --2--> 2 --3--> 3 --4--> 4
--       \                /
--        \____  ... ____/
--
-- Se x == y, já chegamos ao destino.
-- Senão, olhamos para todos os vizinhos de x e tentamos chegar em y a partir deles.
--
hasPath :: [(Int, Int)] -> Int -> Int -> Bool
hasPath [] x y = x == y
hasPath xs x y
  | x == y = True
  | otherwise =
      -- remove todas as arestas que saem de x
      -- para não repetir o mesmo nó em loop infinito
      let remaining = [(n, m) | (n, m) <- xs, n /= x]
      in or [hasPath remaining m y | (n, m) <- xs, n == x]

-- Exemplo de execução:
-- hasPath [(1,2),(2,3),(3,4)] 1 4
--   -> x = 1, y = 4
--   -> encontra arestas saindo de 1: (1,2)
--   -> chama hasPath restante 2 4
--   -> encontra arestas saindo de 2: (2,3)
--   -> chama hasPath restante 3 4
--   -> encontra arestas saindo de 3: (3,4)
--   -> chama hasPath restante 4 4
--   -> como x == y, retorna True
