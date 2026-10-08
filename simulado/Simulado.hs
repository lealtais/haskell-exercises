module Simulado where

-- ============================================================================
-- SIMULADO: ITE-002 - Tópicos Especiais em Sistemas para Internet (Prog. Funcional)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- QUESTÃO 1 (valor 1,0 ponto)
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
-- QUESTÃO 2 (valor 2,0 pontos)
-- Dado o tipo de dado: data Arvore a = Galho a (Arvore a) (Arvore a) | Folha a | Nulo
-- Escreva a expressão equivalente à árvore da imagem.
-- ----------------------------------------------------------------------------

-- Nota: No simulado impresso o professor usou 'Nulo' em ambas as questões.
-- Em Haskell no mesmo módulo, renomeamos para NuloArvore para evitar conflito de construtor.
data Arvore a = Galho a (Arvore a) (Arvore a) 
              | Folha a 
              | NuloArvore 
              deriving (Show, Eq)

-- Expressão da resposta oficial da questão (na folha da prova você escreve Nulo):
arvoreResposta :: Arvore Int
arvoreResposta = Galho 30 (Galho 20 NuloArvore (Folha 3)) (Galho 45 (Folha 41) NuloArvore)


-- ----------------------------------------------------------------------------
-- QUESTÃO 3 (valor 3,0 pontos)
-- Modelagem de imóveis e bairros em Haskell.
-- (a) Defina o tipo Imovel contendo os construtores Casa e Apartamento.
--     Ambos devem armazenar: metragem quadrada e preço.
-- (b) Defina o tipo Bairro contendo Pompeia e SantaMaria.
--     Ambos devem armazenar: lista [Imovel], descrição e preço médio do m².
-- ----------------------------------------------------------------------------

-- (a) Tipo Imovel (metragem quadrada :: Float, preco :: Float)
data Imovel = Casa Float Float
            | Apartamento Float Float
            deriving (Show, Eq)

-- (b) Tipo Bairro ([Imovel], descricao :: String, preco medio m2 :: Float)
data Bairro = Pompeia [Imovel] String Float
            | SantaMaria [Imovel] String Float
            deriving (Show, Eq)

{- 
   *Alternativa com Record Syntax (também 100% correta):*

   data Imovel = Casa { metragem :: Float, preco :: Float }
               | Apartamento { metragem :: Float, preco :: Float }
               deriving (Show, Eq)

   data Bairro = Pompeia { imoveis :: [Imovel], descricao :: String, precoMedioM2 :: Float }
               | SantaMaria { imoveis :: [Imovel], descricao :: String, precoMedioM2 :: Float }
               deriving (Show, Eq)
-}


-- ----------------------------------------------------------------------------
-- QUESTÃO 4 (valor 2,0 pontos)
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
  (a) O que essa função faz?
      Resposta: A função 'bar' filtra os elementos de uma lista com base no
      predicado 'func'. Se 'func x' avaliar como True, o elemento 'x' é mantido;
      caso contrário, é descartado. Trata-se da implementação da função 'filter'.

  (b) Teste de mesa com: bar (\x -> elem x "FEfe") "FATEC"
      Passo a passo:
      1. x = 'F', xs = "ATEC" -> elem 'F' "FEfe" == True  => 'F' : bar func "ATEC"
      2. x = 'A', xs = "TEC"  -> elem 'A' "FEfe" == False => bar func "TEC"
      3. x = 'T', xs = "EC"   -> elem 'T' "FEfe" == False => bar func "EC"
      4. x = 'E', xs = "C"    -> elem 'E' "FEfe" == True  => 'E' : bar func "C"
      5. x = 'C', xs = ""     -> elem 'C' "FEfe" == False => bar func ""
      6. caso base: bar func [] = []

      Resultado reconstruído: 'F' : 'E' : [] = ['F', 'E'] = "FE"
-}

testeQuestao4 :: String
testeQuestao4 = bar (\x -> elem x "FEfe") "FATEC"


-- ----------------------------------------------------------------------------
-- QUESTÃO 5 (valor 1,0 ponto)
-- ----------------------------------------------------------------------------

{- 
  (a) :t filter odd
      Resposta: filter odd :: Integral a => [a] -> [a]

  (b) map (\x -> x * 2) [1,3,5,7]
      Resposta: [2,6,10,14]

  (c) :t ("abc", True)
      Resposta: ("abc", True) :: ([Char], Bool)   -- ou (String, Bool)

  (d) foldl (+) 0 [2,4,6,8]
      Resposta: 20  (0 + 2 + 4 + 6 + 8 = 20)

  (e) [x * 3 | x <- [1..6], x > 3]
      Resposta: [12,15,18] (valores 4, 5 e 6 multiplicados por 3)
-}

-- ============================================================================
-- Execução e testes rápidos:
-- ============================================================================
main :: IO ()
main = do
  putStrLn "=== RESOLUÇÃO DO SIMULADO HASKELL ==="
  
  putStrLn "\n[Q1] Teste removerElementoInicio:"
  let l = 10 :>: (20 :>: (30 :>: Nulo))
  print (removerElementoInicio l)

  putStrLn "\n[Q2] Árvore instanciada:"
  print arvoreResposta

  putStrLn "\n[Q3] Imóveis e Bairro:"
  let c = Casa 150.0 500000.0
  let a = Apartamento 70.0 300000.0
  let b = Pompeia [c, a] "Bairro nobre residencial" 7200.0
  print b

  putStrLn "\n[Q4] Teste de mesa da função bar:"
  putStrLn ("Resultado: " ++ show testeQuestao4)

  putStrLn "\n[Q5] Avaliações:"
  putStrLn ("(b) map: " ++ show (map (\x -> x * 2) [1,3,5,7]))
  putStrLn ("(d) foldl: " ++ show (foldl (+) 0 [2,4,6,8]))
  putStrLn ("(e) list comp: " ++ show [x * 3 | x <- [1..6], x > 3])
