-- No lugar de um loop igual na linguagem semantica, usamos recursão para percorrer listas e realizar operações. Abaixo estão algumas funções que demonstram o uso de recursão em Haskell.
--Nao pode ter chamada infinita, por isso é importante ter uma condição de parada.

-- Funcao recusirva eh uma funcao definida em termoa dela memsi possui tres partes 
-- ->  PARTICAO DO PROBLLEMA EM SUBPRONMAS
-- -> a base final da recursao quando os problemas sao taoa pquenos que podem ser resolvidos diretamente, geralne de maneira trivial (caso base)
-- -> A combinacao da repostara parciai, formando a reposta  toptal 


fatorial :: Integer -> Integer 
fatorial n 
    | n == 0 = 1  -- caso base 
    | n > 0 = n * fatorial (n-1) -- caso recursivo, a funcao se chama a si mesma com um valor menor de n


-- Recursoa em calda de funções auxiliares, como `elem`, `nub`, `isAsc`, e `hasPath`, permite que você manipule listas e verifique condições de maneira eficiente. Cada função é definida com base em casos base e casos recursivos, garantindo que a execução termine corretamente.



divrec :: Int -> Int -> Int
divrec a b
  | b > a = a --caso base
  | b == a = 0 
  | otherwise = divrec ( a - b ) b -- c


