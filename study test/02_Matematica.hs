-- 02_Matematica.hs
-- Exemplos de funções puras, recursão e listas em Haskell.

-- Função para calcular o fatorial de um número
fatorial :: Integer -> Integer
fatorial 0 = 1
fatorial n = n * fatorial (n - 1)

-- Função para calcular o n-ésimo número de Fibonacci
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Função que filtra números pares
apenasPares :: [Int] -> [Int]
apenasPares lista = filter even lista

-- Dobrar todos os números usando List Comprehension
dobrarLista :: [Int] -> [Int]
dobrarLista lista = [x * 2 | x <- lista]

main :: IO ()
main = do
    putStrLn "--- Testes Matemáticos e Recursão em Haskell ---"
    
    putStrLn $ "Fatorial de 5: " ++ show (fatorial 5)
    putStrLn $ "Fatorial de 10: " ++ show (fatorial 10)
    
    putStrLn "\nPrimeiros números de Fibonacci:"
    let fibs = map fibonacci [0..10]
    print fibs
    
    let numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    putStrLn $ "\nLista original: " ++ show numeros
    putStrLn $ "Apenas pares: " ++ show (apenasPares numeros)
    putStrLn $ "Valores dobrados: " ++ show (dobrarLista numeros)
    putStrLn $ "Soma total da lista: " ++ show (sum numeros)
