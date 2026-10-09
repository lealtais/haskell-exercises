module Prova where

-- ============================================================================
-- SIMULADO: ITE-002 - Tópicos Especiais em Sistemas para Internet (Prog. Funcional)
-- Data: 02 de outubro de 2026 | Duração: 2 horas | Total: 10 pontos
-- ============================================================================
-- INSTRUÇÕES:
-- Responda a cada questão no espaço abaixo do enunciado.
-- Não olhe a resolução antes de tentar fazer tudo sozinha!
-- Quando terminar, salve o arquivo e me chame para eu corrigir e te dar a nota.
-- ============================================================================


-- ============================================================================
-- QUESTÃO 1 (valor 1,0 ponto)
-- ============================================================================
-- Dado o tipo de dado algébrico:
-- "List a = a :>: (List a) | Nulo"
--
-- Implemente a função removerElementoInicio que recebe um tipo "List a"
-- e retorna um tipo "List a" sem o primeiro elemento.
-- (remove o primeiro elemento do List a).
-- ============================================================================

data List a = a :>: (List a) | Nulo deriving (Show, Eq)

-- Escreva sua implementação aqui:
-- removerElementoInicio :: ...




-- ============================================================================
-- QUESTÃO 2 (valor 2,0 pontos)
-- ============================================================================
-- Dado o tipo de dado:
-- data Arvore a = Galho a (Arvore a) (Arvore a) | Folha a | Nulo
--
-- E o desenho de árvore a seguir:
--
--                  [ Galho 30 ]
--                  /          \
--                 /            \
--          [ Galho 20 ]    [ Galho 45 ]
--          /          \    /          \
--      [ Nulo ] [ Folha 3 ] [ Folha 41 ] [ Nulo ]
--
-- Escreva a expressão em Haskell equivalente à árvore da imagem usando
-- como base o tipo de dado algébrico Arvore a.
-- ============================================================================

-- Nota: para não dar conflito de nome com o 'Nulo' da Questão 1 se for compilar,
-- usei 'NuloA' aqui abaixo, mas na folha de papel da prova você escreve 'Nulo':
data Arvore a = Galho a (Arvore a) (Arvore a) | Folha a | NuloA deriving (Show, Eq)

-- Escreva sua expressão aqui:
-- minhaArvore :: Arvore Int
-- minhaArvore = ...




-- ============================================================================
-- QUESTÃO 3 (valor 3,0 pontos)
-- ============================================================================
-- Considere a modelagem de imóveis e bairros na linguagem Haskell.
-- Implemente o que se pede a seguir:
--
-- (a) (2,0 pontos) Defina o tipo de dado Imovel, contendo os value constructors
--     Casa e Apartamento. Ambos devem armazenar as seguintes informações:
--     • metragem quadrada;
--     • preço.
--
-- (b) (1,0 ponto) Defina o tipo de dado Bairro, contendo os value constructors
--     Pompeia e SantaMaria. Ambos devem armazenar:
--     • uma lista de imóveis do tipo [Imovel];
--     • uma descrição;
--     • o preço médio do metro quadrado.
-- ============================================================================

-- (a) Escreva o tipo Imovel aqui:




-- (b) Escreva o tipo Bairro aqui:




-- ============================================================================
-- QUESTÃO 4 (valor 2,0 pontos)
-- ============================================================================
-- Dado a implementação a seguir:
--
-- bar :: (Eq a) => (a -> Bool) -> [a] -> [a]
-- bar func [] = []
-- bar func (x:xs)
--   | func x == True = x : bar func xs
--   | otherwise      = bar func xs
--
-- Responda:
--
-- (a) O que essa função faz?
-- Resposta (a):
-- 
--
-- (b) Faça um teste de mesa com o seguinte valor:
--     bar (\x -> elem x "FEfe") "FATEC"
--
-- Resposta (b) - Escreva o passo a passo do teste de mesa e o resultado final:
-- 
-- ============================================================================




-- ============================================================================
-- QUESTÃO 5 (valor 1,0 ponto)
-- ============================================================================
-- Analise as expressões em Haskell a seguir e responda ao que se pede.
-- Para as expressões com :t, informe o tipo retornado.
-- Para as demais, apresente o resultado da avaliação.
--
-- (a) :t filter odd
-- Resposta (a):
--
-- (b) map (\x -> x * 2) [1,3,5,7]
-- Resposta (b):
--
-- (c) :t ("abc", True)
-- Resposta (c):
--
-- (d) foldl (+) 0 [2,4,6,8]
-- Resposta (d):
--
-- (e) [x * 3 | x <- [1..6], x > 3]
-- Resposta (e):
-- ============================================================================
