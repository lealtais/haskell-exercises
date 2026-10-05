# Guia Rápido de Haskell e GHCi no Windows

Parabéns! Seu ambiente Haskell foi preparado com as ferramentas oficiais e modernas (GHC, GHCi e Stack).

---

## 🛠️ O que foi instalado no seu computador?

1. **Stack (`stack`)**: O gerenciador de projetos, compiladores e pacotes do ecossistema Haskell.
2. **GHC (Glasgow Haskell Compiler)**: O compilador oficial e padrão da indústria para Haskell.
3. **GHCi (`ghci`)**: O ambiente interativo (REPL) para testar expressões, funções e carregar arquivos `.hs` em tempo real.

---

## 🚀 Como Rodar os Exemplos

Você pode rodar os códigos tanto pelo terminal quanto de forma interativa.

### Opção 1: Executar diretamente como script (sem precisar compilar antes)

Abra o PowerShell nesta pasta e execute:

```powershell
stack runghc 01_OlaMundo.hs
stack runghc 02_Matematica.hs
stack runghc 03_TiposEDados.hs
stack runghc 04_Interativo.hs
```

### Opção 2: Compilar para um executável `.exe` nativo

Se quiser gerar um binário `.exe` super rápido e otimizado:

```powershell
stack ghc -- 01_OlaMundo.hs
.\01_OlaMundo.exe
```

---

## 💡 Como Usar o GHCi (Terminal Interativo do Haskell)

O **GHCi** é o recurso mais poderoso para quem está aprendendo Haskell. Nele você pode digitar código e ver a resposta na hora.

### 1. Iniciar o GHCi

```powershell
stack ghci
```

### 2. Carregar um arquivo no GHCi

Dentro do prompt do GHCi (`ghci>`):

```haskell
:load 02_Matematica.hs
```

Agora você pode chamar diretamente as funções definidas no arquivo:

```haskell
fatorial 5
-- Resultado: 120

fibonacci 8
-- Resultado: 21

apenasPares [1, 2, 3, 4, 5, 6]
-- Resultado: [2, 4, 6]
```

### 3. Recarregar após editar o código

Se você fizer alterações no arquivo `.hs` no seu editor, basta digitar no GHCi:

```haskell
:reload
```
(ou apenas `:r`)

### 4. Consultar Tipos e Informações

O sistema de tipos do Haskell é um dos mais avançados do mundo. Você pode perguntar o tipo de qualquer coisa:

```haskell
:type fatorial
-- fatorial :: Integer -> Integer

:type filter
-- filter :: (a -> Bool) -> [a] -> [a]

:info Int
```

### 5. Sair do GHCi

```haskell
:quit
```
(ou apenas `:q`)

---

## 📂 Arquivos de Exemplo Criados:

- **`01_OlaMundo.hs`**: O clássico primeiro passo, demonstrando a função `main` e `putStrLn`.
- **`02_Matematica.hs`**: Funções recursivas (Fatorial e Fibonacci), manipulação de listas, funções de alta ordem (`filter`, `map`) e list comprehensions.
- **`03_TiposEDados.hs`**: Criação de tipos próprios (`data`), Record Syntax, Pattern Matching e o tipo `Maybe` (para evitar erros nulos).
- **`04_Interativo.hs`**: Interação com o usuário via terminal (`getLine`, conversão de tipos com `read`).
- **`05_PatternMatchingEListas.hs`**: Pattern matching (`isZero`), acumuladores (`aux`/`where`), construtores de listas (`[]` e `x:xs`) e função `asc`.
