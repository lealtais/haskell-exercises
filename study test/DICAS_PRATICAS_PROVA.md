# 🧠 Dicas Práticas de Haskell (Sem Enrolação Acadêmica)

> Guia direto ao ponto para revisar no outro computador antes da prova.  
> Sem jargões de matemática abstrata — apenas analogias simples e o que cai no papel.

---

## 1. O que é `data`? (Caixinhas com Etiquetas)

No Java ou C# você cria classes; no C você cria `structs`.  
No Haskell, você usa **`data`** simplesmente para **inventar um tipo que não existe na linguagem**.

Pense no `data` como **criar caixinhas com etiquetas**:

```haskell
data Forma = Circulo Float | Retangulo Float Float
```
* **O que significa?**
  * Criamos o tipo `Forma`.
  * O pipe `|` é simplesmente um **OU**.
  * Uma `Forma` pode ser:
    * Uma caixinha com a etiqueta `Circulo`, guardando **1 número** (o raio);
    * **OU**
    * Uma caixinha com a etiqueta `Retangulo`, guardando **2 números** (base e altura).

### 🎯 Como isso cai na prova (Questão 3):
```haskell
-- (a) Casa e Apartamento guardando metragem e preço:
data Imovel = Casa Float Float
            | Apartamento Float Float
            deriving (Show, Eq)

-- (b) Bairro guardando uma lista de Imoveis, descrição e preço médio/m²:
data Bairro = Pompeia [Imovel] String Float
            | SantaMaria [Imovel] String Float
            deriving (Show, Eq)
```
*(Não tem segredo: é só listar os tipos de dados que vão dentro de cada etiqueta!)*

---

## 2. Estruturas Recursivas: Listas e Árvores (A Boneca Russa)

Estruturas recursivas são apenas **caixinhas dentro de caixinhas** (bonecas russas).

### Lista Própria com operador estranho (Questão 1):
O professor inventa símbolos para assustar:
```haskell
data List a = a :>: (List a) | Nulo
```
**Tradução mental:**
- `:>:` é exatamente o operador `:` (*cons*). Junta a cabeça com o resto.
- `Nulo` é exatamente a lista vazia `[]`.
- `1 :>: (2 :>: (3 :>: Nulo))` é o mesmo que `[1, 2, 3]`.

Se o enunciado pedir para **remover o primeiro elemento**:
```haskell
removerElementoInicio :: List a -> List a
removerElementoInicio (primeiro :>: resto) = resto
removerElementoInicio Nulo                 = Nulo
```
*(Você descarta o `primeiro` e devolve o `resto`. Só isso!)*

---

### Árvores Binárias (Questão 2):
```haskell
data Arvore a = Galho a (Arvore a) (Arvore a) | Folha a | Nulo
```
* **`Galho VALOR ESQUERDA DIREITA`**: Uma bifurcação com 1 valor no meio e 2 caminhos.
* **`Folha VALOR`**: A ponta final (sem mais ramificações).
* **`Nulo`**: Caminho vazio.

**Como montar no papel sem errar:**
Comece sempre pela raiz e use parênteses em cada sub-galho:
```haskell
-- Raiz 30, esquerda 20 (com Nulo e Folha 3), direita 45 (com Folha 41 e Nulo)
Galho 30 (Galho 20 Nulo (Folha 3)) (Galho 45 (Folha 41) Nulo)
```

---

## 3. Funções de Alta Ordem (A Linha de Fábrica)

Em vez de decodificar teoremas matemáticos, imagine uma **linha de fábrica**:

### 🛠️ `map` (O Transformador)
Passa cada item da esteira e aplica uma ferramenta:
```haskell
map (\x -> x * 2) [1, 3, 5, 7]
-- Resultado: [2, 6, 10, 14]
```
*(O tamanho da lista nunca muda; só o conteúdo é transformado).*

---

### 🛡️ `filter` (O Porteiro)
Olha para cada item: se der `True`, passa; se der `False`, vai pro lixo:
```haskell
filter odd [1, 2, 3, 4, 5]
-- Resultado: [1, 3, 5]
```

#### 🚨 Pegadinha da Prova (Questão 4):
O professor deu esta função disfarçada:
```haskell
bar func [] = []
bar func (x:xs)
  | func x == True = x : bar func xs
  | otherwise      = bar func xs
```
* **(a) O que essa função faz?**  
  **Resposta:** Ela é a própria implementação da função **`filter`**. Ela percorre a lista e só mantém os elementos que satisfazem a condição `func x == True`.

* **(b) Teste de Mesa com:** `bar (\x -> elem x "FEfe") "FATEC"`  
  Faça a tabelinha no papel:
  1. Letra `'F'`: `'F'` está em `"FEfe"`? **True** $\rightarrow$ guarda `'F'`
  2. Letra `'A'`: `'A'` está em `"FEfe"`? **False** $\rightarrow$ descarta
  3. Letra `'T'`: `'T'` está em `"FEfe"`? **False** $\rightarrow$ descarta
  4. Letra `'E'`: `'E'` está em `"FEfe"`? **True** $\rightarrow$ guarda `'E'`
  5. Letra `'C'`: `'C'` está em `"FEfe"`? **False** $\rightarrow$ descarta
  6. Fim `[]` $\rightarrow$ `[]`  
  **Resultado final:** `"FE"`

---

### 🔨 `foldl` (O Triturador / Acumulador)
Pega todos os elementos da lista e amassa em um único valor final:
```haskell
foldl (+) 0 [2, 4, 6, 8]
```
Como fazer a conta no papel:
1. Começa com o acumulador `0`
2. `0 + 2 = 2`
3. `2 + 4 = 6`
4. `6 + 6 = 12`
5. `12 + 8 = 20`  
**Resultado:** `20`

---

## 4. Cálculos Rápidos de 1 Ponto (Questão 5)

* **List Comprehension:**  
  `[x * 3 | x <- [1..6], x > 3]`  
  *Tradução:* Pegue os números de 1 até 6 maiores que 3 (`4, 5, 6`) e multiplique cada um por 3:  
  **Resultado:** `[12, 15, 18]`

* **Tipo com `:t`:**  
  `:t ("abc", True)`  
  **Resposta:** `([Char], Bool)` ou `(String, Bool)`

  `:t filter odd`  
  **Resposta:** `Integral a => [a] -> [a]` *(pois `odd` exige números inteiros)*.

---

## 💡 Resumo de Ouro para a Prova:
1. Se pedir para criar modelo $\rightarrow$ Use **`data`** com maiúsculas nos nomes e construtores.
2. Se tiver `|` $\rightarrow$ É **OU** (uma opção ou outra).
3. Se tiver árvore $\rightarrow$ Raiz fora, sub-árvores sempre entre **parênteses**.
4. Se vir função com `| func x == True = x : ...` $\rightarrow$ É o **`filter`**!
