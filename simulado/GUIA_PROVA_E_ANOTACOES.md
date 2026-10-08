# 📝 Guia Completo de Revisão para a Prova de Haskell

> Material preparado com base no **Simulado de Programação Funcional (ITE-002)**.  
> Código executável correspondente disponível em: [`Simulado.hs`](./Simulado.hs).

---

## 🧭 Sumário
1. [As 3 Sacadas que Destravam a Prova](#-as-3-sacadas-que-destravam-a-prova)
2. [Gabarito Passo a Passo do Simulado](#-gabarito-passo-a-passo-do-simulado)
3. [Folha de Cola A4 Pronta (Para Copiar e Levar)](#-folha-de-cola-a4-pronta-para-levar-na-prova)
4. [Links Recomendados no YouTube](#-links-recomendados-no-youtube)

---

## 💡 As 3 Sacadas que Destravam a Prova

### 1. Criando seus próprios tipos com `data` (Tipos Algébricos)
No Haskell, quando você quer agrupar dados como se fosse uma *classe* ou *struct*, você usa `data`:

```haskell
-- Sintaxe:
data NomeDoTipo = Construtor1 TipoA TipoB
                | Construtor2 TipoC TipoD
                deriving (Show, Eq)
```
- O pipe `|` funciona como um **OU** (um imóvel pode ser uma `Casa` OU um `Apartamento`).
- `Casa` e `Apartamento` são construtores que guardam valores dentro deles.
- `deriving (Show, Eq)` permite que o Haskell imprima (`print`) e compare (`==`) seus valores.

---

### 2. Árvores Binárias em Haskell
Uma árvore binária é apenas uma estrutura recursiva:
- Ou ela é um nó com filhos (`Galho`);
- Ou ela é uma ponta final com valor (`Folha`);
- Ou ela é vazia (`Nulo`).

```haskell
data Arvore a = Galho a (Arvore a) (Arvore a) 
              | Folha a 
              | Nulo
```
Para montar uma árvore no papel ou no código, comece da **raiz** e coloque cada subárvore entre parênteses:
```haskell
-- Raiz 30, galho esquerdo 20 (com Nulo e Folha 3), galho direito 45 (com Folha 41 e Nulo)
Galho 30 (Galho 20 Nulo (Folha 3)) (Galho 45 (Folha 41) Nulo)
```

---

### 3. Listas customizadas com operadores próprios (`:>:`)
Você já conhece a lista padrão do Haskell com `(x:xs)` e `[]`.  
Quando o professor define:
```haskell
data List a = a :>: (List a) | Nulo
```
Ele está apenas trocando de roupa:
- `:>:` faz exatamente o mesmo papel do `:` (cons).
- `Nulo` faz o mesmo papel do `[]` (lista vazia).

Para remover a cabeça (primeiro elemento) e ficar com a cauda:
```haskell
removerElementoInicio (x :>: xs) = xs
removerElementoInicio Nulo       = Nulo
```

---

## 🎯 Gabarito Passo a Passo do Simulado

### Questão 1 (1,0 ponto)
**Enunciado:** Dado `data List a = a :>: (List a) | Nulo`, implemente `removerElementoInicio`.
```haskell
removerElementoInicio :: List a -> List a
removerElementoInicio (x :>: xs) = xs
removerElementoInicio Nulo       = Nulo
```

---

### Questão 2 (2,0 pontos)
**Enunciado:** Escreva a expressão equivalente ao diagrama da árvore dada.
```haskell
Galho 30 (Galho 20 Nulo (Folha 3)) (Galho 45 (Folha 41) Nulo)
```

---

### Questão 3 (3,0 pontos)
**Enunciado:**
- `(a)` Tipo `Imovel` com construtores `Casa` e `Apartamento` (metragem quadrada e preço).
- `(b)` Tipo `Bairro` com `Pompeia` e `SantaMaria` (`[Imovel]`, descrição e preço médio/m²).

```haskell
-- (a)
data Imovel = Casa Float Float
            | Apartamento Float Float
            deriving (Show, Eq)

-- (b)
data Bairro = Pompeia [Imovel] String Float
            | SantaMaria [Imovel] String Float
            deriving (Show, Eq)
```

*(Ou usando Record Syntax:)*
```haskell
data Imovel = Casa { metragem :: Float, preco :: Float }
            | Apartamento { metragem :: Float, preco :: Float }
            deriving (Show, Eq)

data Bairro = Pompeia { imoveis :: [Imovel], descricao :: String, precoMedioM2 :: Float }
            | SantaMaria { imoveis :: [Imovel], descricao :: String, precoMedioM2 :: Float }
            deriving (Show, Eq)
```

---

### Questão 4 (2,0 pontos)
**Enunciado:**
```haskell
bar :: (Eq a) => (a -> Bool) -> [a] -> [a]
bar func [] = []
bar func (x:xs)
  | func x == True = x : bar func xs
  | otherwise      = bar func xs
```
- **(a) O que essa função faz?**  
  *Resposta:* A função `bar` filtra uma lista preservando apenas os elementos que satisfazem a condição booleana dada pela função `func` (quando `func x == True`). Ela é a implementação da função de alta ordem `filter`.

- **(b) Teste de mesa com:** `bar (\x -> elem x "FEfe") "FATEC"`
  1. `x = 'F'`: `'F'` está em `"FEfe"`? **True** $\rightarrow$ inclui `'F'`
  2. `x = 'A'`: `'A'` está em `"FEfe"`? **False** $\rightarrow$ descarta
  3. `x = 'T'`: `'T'` está em `"FEfe"`? **False** $\rightarrow$ descarta
  4. `x = 'E'`: `'E'` está em `"FEfe"`? **True** $\rightarrow$ inclui `'E'`
  5. `x = 'C'`: `'C'` está em `"FEfe"`? **False** $\rightarrow$ descarta
  6. Caso base: `[]` $\rightarrow$ `[]`
  *Resultado final:* `"FE"`

---

### Questão 5 (1,0 ponto)
- `(a)` `:t filter odd` $\rightarrow$ `filter odd :: Integral a => [a] -> [a]`
- `(b)` `map (\x -> x * 2) [1,3,5,7]` $\rightarrow$ `[2,6,10,14]`
- `(c)` `:t ("abc", True)` $\rightarrow$ `("abc", True) :: ([Char], Bool)` *(ou `(String, Bool)`)*
- `(d)` `foldl (+) 0 [2,4,6,8]` $\rightarrow$ `20`
- `(e)` `[x * 3 | x <- [1..6], x > 3]` $\rightarrow$ `[12,15,18]`

---

## 📄 Folha de Cola A4 Pronta (Para Levar na Prova)

Copie esta seção para a folha A4 permitida para consulta:

```haskell
-- =================== SINTAXE DE TIPOS (DATA) ===================
data TipoSimples = C1 Int Float | C2 String deriving (Show, Eq)
data Ponto = Ponto2D Float Float | Ponto3D Float Float Float

-- Record Syntax:
data Pessoa = Pessoa { nome :: String, idade :: Int } deriving Show

-- =================== ESTRUTURAS RECURSIVAS ===================
-- Lista Encadeada Própria:
data List a = a :>: (List a) | Nulo deriving (Show, Eq)
cabeca (x :>: xs) = x
calda  (x :>: xs) = xs

-- Árvore Binária:
data Arvore a = Galho a (Arvore a) (Arvore a) | Folha a | Nulo deriving (Show, Eq)
-- Montagem: Galho VALOR (FILHO_ESQ) (FILHO_DIR)
-- Ex: Galho 10 (Folha 5) (Galho 20 Nulo (Folha 25))

-- =================== FUNÇÕES DE ALTA ORDEM ===================
-- Map: aplica uma função a cada elemento
map :: (a -> b) -> [a] -> [b]
-- Ex: map (\x -> x * 2) [1,2,3] => [2,4,6]

-- Filter: filtra quem dá True
filter :: (a -> Bool) -> [a] -> [a]
-- Ex: filter odd [1,2,3,4] => [1,3]

-- Folds: acumula a lista
foldl :: (b -> a -> b) -> b -> [a] -> b  -- da esquerda para direita
-- Ex: foldl (+) 0 [1,2,3] => ((0+1)+2)+3 = 6

-- =================== COMPREENSÃO DE LISTAS ===================
-- [ expressao | variavel <- lista, condicoes ]
-- Ex: [x * 2 | x <- [1..10], x `mod` 2 == 0]
```

---

## 📺 Links Recomendados no YouTube

Se quiser assistir vídeos para reforçar:

1. **[UFABC - 7.2 Tipos de Dados Algébricos](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF3kGVcwE-fvbZJO5_eIqjLVp-Nwt_jWdqCmAtp4cXBt8z0kw8ThMUk237toQzPppYSqCZ6Wrs_QHQqj-T-dAcv6aK1qh5n4tiVCVF5eQm7s3IE3QAo6uwiMWuqMO-36RQ=)**  
   *Por que assistir:* Explica em português claro como criar novos tipos com a palavra-chave `data`, tipos soma (`|`) e tipos produto.
2. **[UFABC - 7.3 Tipos de Dados Recursivos (Árvores e Listas)](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFfL2l4OUsr7xdlxrKQMShwNhVGhzFkvF9Z_JTQD9acukKgFaPTKBu3V1GWLw4sWKtbk5IbsJnXfqObnoVw1XLpXxEJV6wha1bfm4ofPWSfWSrff_Rhr1Sc0ICXVXZ0M2Q=)**  
   *Por que assistir:* É exatamente a matéria da prova — mostra como declarar árvores binárias (`Node`, `Empty`) e listas encadeadas customizadas em Haskell.
3. **[Algebraic Data Types in 10 Minutes](https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHu2ozP39w52V9cbBn3BtXx1aHPs2o6NCtMsg6sUqSe1j_5JpiUpqjs-erpmgzkio45iK5YIWf5Y2p_T9qSPEQ1XROd5W6gMc_4Go40JC_J4OPm-0kKLzOOovFNbi2oxFI=)**  
   *Por que assistir:* Rápido, visual e direto ao ponto sobre o funcionamento do `data` em Haskell.
