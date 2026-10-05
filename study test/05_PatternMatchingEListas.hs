-- 05_PatternMatchingEListas.hs
-- Exemplos de Pattern Matching, Recursão com Acumulador (where/guards) e Construtores de Lista.

module Main where

-- 1. Pattern Matching simples
-- O curinga (_) captura qualquer outro valor.
isZero :: Int -> Bool
isZero 0 = True
isZero _ = False

-- 2. Fatorial com recursão em cauda e acumulador
-- Correções feitas:
--   - "aux n 1" (com espaço, pois em Haskell argumentos são separados por espaço)
--   - "n <= 1" em vez de "n <- 1" (guardas usam operadores de comparação)
--   - Indentação correta dentro do bloco 'where'
fac :: Integer -> Integer
fac n = aux n 1
  where
    aux curr acc
      | curr <= 1 = acc
      | otherwise = aux (curr - 1) (curr * acc)

-- 3. Lista e seus construtores:
-- Toda lista em Haskell é construída com:
--   []     -> Lista vazia
--   (x:xs) -> Operador cons (:) que insere 'x' no início da cauda 'xs'
-- Listas são homogêneas: todos os elementos devem ser do mesmo tipo.

-- 4. Função 'asc': gera uma lista de inteiros de 'n' até 'm'
-- Assinatura usa '::' (dois pontos duplos):
asc :: Int -> Int -> [Int]
asc n m
  | n > m     = []
  | n == m    = [m]
  | otherwise = n : asc (n + 1) m

-- Também podemos usar Pattern Matching diretamente em listas:
somarLista :: [Int] -> Int
somarLista []     = 0          -- Caso base: lista vazia soma 0
somarLista (x:xs) = x + somarLista xs -- Cabeça 'x' somada à recursão da cauda 'xs'

main :: IO ()
main = do
    putStrLn "=========================================="
    putStrLn "   Pattern Matching, Acumuladores e Listas"
    putStrLn "=========================================="

    -- Testando isZero
    putStrLn "\n--- 1. Teste isZero ---"
    putStrLn $ "isZero 0 = " ++ show (isZero 0)
    putStrLn $ "isZero 5 = " ++ show (isZero 5)

    -- Testando fac com acumulador
    putStrLn "\n--- 2. Teste Fatorial com aux/where ---"
    putStrLn $ "fac 5 = " ++ show (fac 5)
    putStrLn $ "fac 10 = " ++ show (fac 10)

    -- Testando asc (gerador de listas com construtor ':')
    putStrLn "\n--- 3. Teste asc (n até m) ---"
    putStrLn $ "asc 1 5   = " ++ show (asc 1 5)
    putStrLn $ "asc 3 3   = " ++ show (asc 3 3)
    putStrLn $ "asc 10 5  = " ++ show (asc 10 5)

    -- Testando somarLista com construtor (x:xs)
    putStrLn "\n--- 4. Teste somarLista com pattern matching (x:xs) ---"
    let minhaLista = asc 1 10
    putStrLn $ "Lista: " ++ show minhaLista
    putStrLn $ "Soma da lista: " ++ show (somarLista minhaLista)
