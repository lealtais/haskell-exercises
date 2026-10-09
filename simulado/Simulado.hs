module Simulado where

-- ============================================================================
-- SIMULADO: ITE-002 - Tópicos Especiais em Sistemas para Internet (Prog. Funcional)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- QUESTÃO 1 (valor 1 ponto)
-- Dado o tipo de dado algébrico "List a = a :>: (List a) | Nulo",
-- implemente a função removerElementoInicio que recebe um tipo "List a"
-- e retorna um tipo "List a" sem o primeiro elemento.
-- ----------------------------------------------------------------------------

data List a = a :>: (List a) | Nulo 
  deriving (Show, Eq)

removerElementoInicio :: List a -> List a
removerElementoInicio (x :>: xs) = xs
removerElementoInicio Nulo       = Nulo

-- Exemplo para testar:
-- let minhaLista = 10 :>: (20 :>: (30 :>: Nulo))
-- removerElementoInicio minhaLista  ==>  20 :>: (30 :>: Nulo)


-- ----------------------------------------------------------------------------
-- QUESTÃO 2 (valor 2 pontos)
-- Dado o tipo de dado: data Arvore a = Galho a (Arvore a) (Arvore a) | Folha a | Nulo
-- Escreva a expressão equivalente à árvore da imagem.
-- ----------------------------------------------------------------------------

-- Nota: No simulado em papel, o professor usou 'Nulo' em ambas as questões.
-- No Haskell real, dois tipos no mesmo arquivo não podem ter construtores com o mesmo nome,
-- por isso nomeamos aqui como 'NuloArvore' (na folha da prova você escreve 'Nulo').
data Arvore a = Galho a (Arvore a) (Arvore a) 
              | Folha a 
              | NuloArvore 
              deriving (Show, Eq)

-- Expressão que responde a questão (na prova, use Nulo):
arvoreResposta :: Arvore Int
arvoreResposta = Galho 30 (Galho 20 NuloArvore (Folha 3)) (Galho 45 (Folha 41) NuloArvore)


-- ----------------------------------------------------------------------------
-- QUESTÃO 3 (valor 3 pontos)
-- Modelagem de imóveis e bairros em Haskell.
-- (a) Defina o tipo Imovel contendo os construtores Casa e Apartamento.
--     Ambos devem armazenar: metragem quadrada e preço.
-- (b) Defina o tipo Bairro contendo Pompeia e SantaMaria.
--     Ambos devem armazenar: lista [Imovel], descrição e preço médio do m².
-- ----------------------------------------------------------------------------

-- (a) Tipo Imovel (metragem quadrada :: Float/Double, preco :: Float/Double)
data Imovel = Casa Float Float
            | Apartamento Float Float
            deriving (Show, Eq)

-- (b) Tipo Bairro ([Imovel], descrição :: String, preço médio m² :: Float/Double)
data Bairro = Pompeia [Imovel] String Float
            | SantaMaria [Imovel] String Float
            deriving (Show, Eq)

{- 
   *OBSERVAÇÃO:* Também é perfeitamente válido usar Record Syntax:

   data Imovel = Casa { metragem :: Float, preco :: Float }
               | Apartamento { metragem :: Float, preco :: Float }
               deriving (Show, Eq)

   data Bairro = Pompeia { imoveis :: [Imovel], descricao :: String, precoMedioM2 :: Float }
               | SantaMaria { imoveis :: [Imovel], descricao :: String, precoMedioM2 :: Float }
               deriving (Show, Eq)
-}


-- ----------------------------------------------------------------------------
-- QUESTÃO 4 (valor 2 pontos)
-- bar :: (Eq a) => (a -> Bool) -> [a] -> [a]
-- bar func [] = []
-- bar func (x:xs)
--   | func x == True = x : bar func xs
--   | otherwise = bar func xs
-- ----------------------------------------------------------------------------

bar :: (Eq a) => (a -> Bool) -> [a] -> [a]
bar func [] = []
bar func (x:xs)
  | func x == True = x : bar func xs
  | otherwise      = bar func xs

{- 
  (a) Resposta:
      A função 'bar' filtra os elementos de uma lista com base em uma função
      de teste ('func'). Se 'func x' for True, o elemento 'x' é mantido;
      caso contrário, é descartado. Trata-se da implementação da função padrão 'filter'.

  (b) Resposta (Teste de Mesa):
      Chamada: bar (\x -> elem x "FEfe") "FATEC"
      Predicado func: verifica se o caractere pertence a "FEfe".

      Passo a passo:
      1. x = 'F', xs = "ATEC" -> elem 'F' "FEfe" == True  => 'F' : bar func "ATEC"
      2. x = 'A', xs = "TEC"  -> elem 'A' "FEfe" == False => bar func "TEC"
      3. x = 'T', xs = "EC"   -> elem 'T' "FEfe" == False => bar func "EC"
      4. x = 'E', xs = "C"    -> elem 'E' "FEfe" == True  => 'E' : bar func "C"
      5. x = 'C', xs = ""     -> elem 'C' "FEfe" == False => bar func ""
      6. caso base: bar func [] = []

      Reconstruindo a lista: 'F' : 'E' : [] = ['F', 'E'] = "FE"
      Resultado final: "FE"
-}

testeQuestao4 :: String
testeQuestao4 = bar (\x -> elem x "FEfe") "FATEC"


-- ----------------------------------------------------------------------------
-- QUESTÃO 5 (valor 1 ponto)
-- ----------------------------------------------------------------------------

{- 
  (a) :t filter odd
      Resposta: filter odd :: Integral a => [a] -> [a]
      (odd requer Integral; filter recebe uma lista e retorna uma lista do mesmo tipo)

  (b) map (\x -> x * 2) [1,3,5,7]
      Resposta: [2,6,10,14]

  (c) :t ("abc", True)
      Resposta: ("abc", True) :: ([Char], Bool)   -- ou (String, Bool)

  (d) foldl (+) 0 [2,4,6,8]
      Resposta: 20
      (Cálculo: (((0 + 2) + 4) + 6) + 8 = 20)

  (e) [x * 3 | x <- [1..6], x > 3]
      Resposta: [12,15,18]
      (Para x in [1..6] onde x > 3, temos x = 4, 5, 6. Multiplicados por 3: 12, 15, 18)
-}

-- ============================================================================
-- Função main para você rodar tudo e testar:
-- ============================================================================
main :: IO ()
main = do
  putStrLn "=== TESTES DO SIMULADO ==="
  
  putStrLn "\n--- Questão 1 ---"
  let l = 10 :>: (20 :>: (30 :>: Nulo))
  print (removerElementoInicio l)

  putStrLn "\n--- Questão 2 ---"
  print arvoreResposta

  putStrLn "\n--- Questão 3 ---"
  let c1 = Casa 120.0 450000.0
  let a1 = Apartamento 65.0 280000.0
  let b = Pompeia [c1, a1] "Bairro nobre residencial" 7500.0
  print b

  putStrLn "\n--- Questão 4 (b) ---"
  putStrLn ("Resultado do teste de mesa: " ++ show testeQuestao4)

  putStrLn "\n--- Questão 5 ---"
  putStrLn ("(b) map: " ++ show (map (\x -> x * 2) [1,3,5,7]))
  putStrLn ("(d) foldl: " ++ show (foldl (+) 0 [2,4,6,8]))
  putStrLn ("(e) list comp: " ++ show [x * 3 | x <- [1..6], x > 3])
