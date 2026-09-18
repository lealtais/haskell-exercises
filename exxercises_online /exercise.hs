-- A prigramacao eh um paradigma cujo objetivo eh imitar, as funcoes matematicas, que mapeiam entradas ( dominio )e saidas (imagem)
--Uma de suas caractericicas fundamentais eh que ha nao HA uma nocso de ESTDO e consequentemente nao sao utilizadas comenado s de atributos
-- No codigo funcional o valor da saida de uma funcao depende apenas dos argumentos passados para ela, o que quer dizer que duas chamadas de uma funcao realizadas com o mesmo valor de argumento x sempre chamada de tranaparencia refrncial 
-- Isso a difere de outros paradigmas, onde o estado local global d um programa podem influenciar no resultado da chma de uma funcao 

-- UmA FUNCAO MATETICA  TIPICA COMO O QUADRADADO DE UM NUEMRO 

-- Squre(n) = n * n 

-- Os argumentsod da funcao sao provivi nientes de ma conjunto chamado de dominio enquanrt os valores possiveis de saida formam o conjuntp "imagem" ou contra dominio 

-- uja  funxao mametimatica portanto eh uma relacao de um conjunto A com um conjunto B -> mapeia dados do conjunto para o conjunto imagem de acordo sua definicao 



-- o = em linhas sematicas eh atribuicao, atualiza uam celula de memoria com um novo valor e mudanca der estafp do geral do programa  value = moemria r- valure = valor 

--Funcional signiga queivalencia as variaveis  repreensemtam expressoes reais e imutaveis  quadradro de num eh num * num nop haskell se le eh 

-- Lambda  espcifiica os parametso e o mapeamento de uma funcao, ela eh a funcao proptiamente dita mas naoe nomeada a aseguinte espressao difine que ele um numero ao quadrado (lambda . x *x )    antes de ser avalida a espressao vale para qualqueria mem conjunto dominio no entando apos avaliada para um determina paramettro ela eh aplicada e resulta em um valor  exeplio que o valo no 2  ((lambidax.x*x)2)

-- linguangens funcionaius baseadas do framewoer teoricvo docalculo labda e fornecem um conjumto funcoes primitivas um conjuntops de formas funcionaius para construir funcoes compplesxas a partir das funcoes primitivas iu  operacao de fiuncaop e al gu,a estrutira para repredsentar os dados 

polinomio:: Int -> Int 
polinomio x = x*x + 10*x + 2 

-- polimonio 2 

-- calucula um quadrado de um inteiro
quadrado:: Int -> Int
quadrado n = n * n 

-- sperados por espacos 

-- soma 
soma :: Float  -> Float -> Float
soma a b = a + b  

-- o que entra e o que sai (entrada saida )

-- triplica 

triplica :: Int-> Int
triplica var = var * 3 


-- Definicao da funcao que tem uam (n) our mais entradas (a,b)

--nomes de funcoes e parametros comecam com letras minuscula tipos comecam com letras maiucuslas nao ha parenteste sperando o parametro do nome da funcao 

-- decalrao de tio  o haskell eh fottemente tipada assegurando que a funcao seja aplicasaa argumentos do tipos 

piArea -> Float -> Float 
piArea r = r * r * pi

perimetro -> Float -> Float 
perimetro r = 2 * pi * r

hipotenusa -> Float -> Float -> Float
hipotenusa a b =  square (a'2 + b'2)

diferenca:: Float -> Float -> Float
diferenca r1 r2 = abs(area ri - area r2)







