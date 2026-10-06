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


-- Recursao em calda de funções auxiliares, como `elem`, `nub`, `isAsc`, e `hasPath`, permite que você manipule listas e verifique condições de maneira eficiente. Cada função é definida com base em casos base e casos recursivos, garantindo que a execução termine corretamente.
-- escreva um funsao recuersdiva calcule o resto inteiro da divisao de dois numeros utilizanso subtacoes sucessivas 

divRec :: Int -> Int -> Int
divRec a b
    | b > a = a -- caso base trivial, quando o divisor é maior que o dividendo, o resto é o próprio dividendo
    | b == a = 0 --caso base trivial
    | otherwise = divRec (a - b ) b -- caso recurvsi diminuindo o tamanho do preoblema 


-- 1) Escreva uma função recursiva que receba como parâmetros dois números inteiros positivos, x e n, e retorne o resultado de x*n, realizando somas sucessivas.
-- Exemplo: mult 3 4 = 3 + 3 + 3 + 3 = 12
mult :: Int -> Int -> Int
mult x n
    | n == 0 = 0
    | otherwise = x + mult x (n - 1) -- caso recursivo: soma x repetidas vezes


-- 2) Escreva uma função recursiva para o cálculo do MDC (máximo divisor comum) de dois números inteiros.
-- Veja a definição recursiva:
-- mdc(a, b) = b, se a % b == 0
-- mdc(a, b) = mdc(b, a % b), caso contrário






-- Recursao em cauda eh um tipo de especial de recurso onde o resultado de chamada recursiva nao precisa sser processada de maneira alguma, para produzir o resultado final a linguagem haskell otimiza chamas com recucao em cauda de maeina denonomizar recursos e aumentar eficiema 

-- Listas 

-- Tipo das listas entre colchetes 
-- Lista de listas = [[1,2], [3,4]]  [[Int]] 


-- Preenchemeneto ->  1..10   1,3..10    10,8 .. 8 


-- :  que toma um elemento e uma lista que pode estar vazia como seus argumentos 

-- head e tail -> head retorna o primeiro elemento da lista, tail retorna a lista sem o primeiro elemento
-- ++ concatenacao de listas, concatena duas listas em uma só

compr :: [Int] -> Int -- função que calcula o comprimento de uma lista de inteiros
compr [] = 0 -- caso base: lista vazia tem comprimento 0
compr (h:t) = 1 + compr t -- caso recursivo: soma 1 ao comprimento da cauda da lista

-- Tornando-se por base o operador de construcao (:), lista [1,2,3] pode ser escrira como 1:[2,3], onde 1::Int eh a cabeca da lista (head) e a lista [2,3]::[Int] eh a sua cauda (tail). A funcao compr percorre a lista recursivamente, contando os elementos ate chegar na lista vazia, que eh o caso base da recursao.

-- uma eh vazia ou eh yma lista com cabeca seguida de cauda o exemeplo a seguir implemena uma funcao que calcula o cumprimento de uma lista de inteiros

-- fazer com hull e gurda 

cubo :: Int -> Int
cubo n = n * n * n -- função que calcula o cubo de um número inteiro

aoCubo :: [Int] -> [Int] -- função que recebe uma lista de inteiros e retorna uma lista com os cubos desses inteiros
aoCubo [] = [] -- caso base: lista vazia retorna lista vazia
aoCubo (h:t) = cubo h : aoCubo t -- caso recursivo: aplica a função cubo à cabeça da lista e concatena com o resultado da chamada recursiva à cauda da lista

-- Escreva uma funcao em Haskell que calcule a somatoria so elementos de um vetor de inteiros. 
somatoria :: [Int] -> Int
somatoria [] = 0
somatoria (h:t) = h + somatoria t


-- Esrecva uma funcao e, haskell que verifique se uma string posssuir o caractere informado passado como parametro 

temChar :: [Char] -> Char -> Bool
temChar [] ch = False
temChar (h:t) ch 
    | h == ch = True 
    | otherwise = temChar t ch

-- Escreva uma funcao em Haskell que verifique se uma lista de inteiros possui um elemento maior que o valor informado como parametro
ehMaior :: [Int] -> Int
ehMaior [] = -1 -- caso base: lista vazia é considerada maior que qualquer
ehMaior (h:t) = if h >= maiorcauda then h else maiorcauda
    where maiorcauda = ehMaior t
    
raizes :: Float -> Float -> Float -> [Float]
raizes a b c | delta < 0 = []
      | delta == 0 = [(-b)/(2*a)]
      | delta > 0 = [(-b - sqrt delta)/(2*a),(-b + sqrt delta)/(2*a)]
      where delta = b*b - 4*a*c

--mais pares = [2 * x | x <- [0..10]]

-- escreva uam funcaod em haskell que retorner os 10 primeiros musltiplos de n utilie o gerar lista 

tabuada :: Int -> [Int]
tabuada n = [n * x | x <- [0..10] ]

-- escreva umafunacao que verifique se um determinado numero eh primo 
isprimo :: Int -> Bool
isprimo n = if length [x | x <- [1..n], mod n x ==0] == 2 then True else False 


-- QuickSort eh um algoritmo de ordenacao que utiliza a tecnica de divisao e conquista, onde o problema eh dividido em subproblemas menores, resolvidos recursivamente e combinados para obter a solucao final. O QuickSort escolhe um elemento como pivô e particiona a lista em duas sublistas: uma com elementos menores que o pivô e outra com elementos maiores. Em seguida, aplica-se recursivamente o QuickSort nas sublistas e combina os resultados.
-- 1. escolher um elemento do vetor conhecido como pivo 
-- 2. patriciona o verto de maneira que todos os elementos anteriores ao pivo sejam menor que ele, e todos os elementos posteriores sejam maiores 
-- 3. Ordena recursivamente os vetore de elementos menorres e maios 
-- a baase recursao dao os vetores de tamanho 0 ou 1 que ja se encontram ordenados 
-- a casa passo de algoritmo pelo menos um elemntoo eh colocado sua posicao definitiva, e nao sera mais manipulado no passo seguinte 

qsort :: [Int] -> [Int]
qqsort [] = []
qsort (h:t) = qsort [y | y <- t , y < h ]
                                ++[h]
                                ++ qqsort [y | y <- t, y >= h]

-- Uma tupla, pode der mais de um tipo,  eh cocecaod e valores 
--- os valores sao colocados entre parentesese separados p9or uam virgula ("John", 123456)

--valores de tuplkas sao definidos de maneiras semelhantes as listas mas com a utlizao de parentese ao inves de colces alem disso uma tupla pode conter valores de tipos de diferentes enquando uma lista nao a ordem dosnelesmentos importa de maneira que a tupla (12345,"Jhon")  eh diferente da dupla modstreadsa acima 
-- tupla de par funcoes fst para o priemeiro e o snd para o segundo 
type NomeAluno = String
type MediaNota = Int
type Aluno = (NomeAluno, MediaNota)
type Turma = [Aluno]

-- NOvo nome a tipos que existea para ficar mais legivel ainda 

aprovado :: Turma -> Int -> [NomeAluno]
aprovado tma nota =  [nome | (nome, media) <- tma, media >= nota]

-- crie a respesenracaode um pontod e teres simensoes a representacao deve ser realiszada por meio de uma tupla e a definicao de um novo tipo 
-- escreva uma funcao que caclule a distancia entre dois pontos como arfumentos 

type Ponto = (Float, Float, Float)

distancia (x1,y1,z1) (x2,y2,z2) = sqrt (dx*dx + dy*dy + dz*dz)
    where
        dx = x1-x2
        dy = y1 -y2
        dx =z1-z2


-- Matchinh patterns nocao de casemnto de padroes  ao chamaa  funcaod pasanod um parametro ele tentara encaixar em qual padrao  ele encaiza de cima para baixo os padroes fornecidos pelo programador. o primeiro a ser encontrado eh exceutado com o valor passado como parametro 
