# 🐘 Functional Programming Studies in Haskell

A collection of foundational exercises and practical implementations focusing on core functional programming concepts using **Haskell**.

---

## 📚 References & Study Base

The theoretical background and problem formulations across these modules follow classic functional programming literature and community standards:

* **Thinking Functionally with Haskell** — *Richard Bird* (Cambridge University Press)[cite: 1]
* **Beginning Haskell: A Project-Based Approach** — *Alejandro Serrano Mena* (Apress)[cite: 4]
* **Learn You a Haskell for Great Good!** — *Miran Lipovača* (No Starch Press)[cite: 7, 8]

---

## 🎯 Concepts Covered

- **List Comprehensions:** Generators, element projection, and filtering with boolean predicates (`mod`, `notElem`).
- **Arithmetic Sequences:** Range generation and step-based progressions via `[start, next .. end]`.
- **String and List Manipulation:** Core operations with standard Prelude functions (`length`, `reverse`, `head`, `last`)[cite: 1, 8].
- **Function Composition:** Point-free pipelines using the infix composition operator `(.)`[cite: 1, 5].
- **Data Structures:** Working with homogeneous lists (`[a]`) and fixed-size heterogeneous tuples[cite: 1, 4].

---

## 📂 Exercise Index (`Exercicios.hs`)

| Exercise | Description | Key Concept |
| :--- | :--- | :--- |
| **2.1 a** | Successive powers of 11 | List comprehension with exponentiation (`11^x`)[cite: 1] |
| **2.1 b** | Numbers 1 to 39 excluding multiples of 4 | Filtering via modulo remainder (`x `mod` 4 /= 0`)[cite: 1] |
| **2.1 c** | Pattern generation (`"AaBB"` to `"AgBB"`) | Character interpolation in list of characters (`[Char]`)[cite: 4] |
| **2.1 d** | Sequence `[5, 8 .. 41]` with missing items | Arithmetic sequence combined with `notElem` |
| **2.1 e** | Geometric decay sequence (`1.0, 0.5, 0.25...`) | Floating-point power generation (`Double`)[cite: 4] |
| **2.1 f** | Arithmetic progression with fixed step (+9) | Range with explicit step `[1, 10 .. 64]` |
| **2.1 g** | Even numbers with exclusions | Range `[2, 4 .. 30]` filtered using `notElem` |
| **2.1 h** | Character subset from `@` to `L` | Character range `['@'..'L']` with exclusion predicates |
| **2.2**   | String length parity verification | Checking even length using `length` and `mod 2 == 0`[cite: 1] |
| **2.3**   | Inverting order of elements in a String list | Applying `reverse` over `[String]`[cite: 1, 4] |
| **2.4**   | Filter odd-length Strings and return lengths | Projection and filtering via list comprehension |
| **2.5**   | Reimplementing `head` via function composition | Point-free pipeline `last . reverse`[cite: 1, 8] |
| **2.6**   | Palindrome detection | Equality comparison between string and `reverse`[cite: 1, 4] |
| **2.7**   | Multiples tuple calculation | Generating 4-tuples with basic arithmetic expressions[cite: 1] |

---

## 🛠️ How to Run

Ensure that the **GHC / GHCi** environment is installed on your system[cite: 1, 4, 6, 8].

1. Clone the repository:
   ```bash
   git clone [https://github.com/YOUR-USERNAME/YOUR-REPOSITORY-NAME.git](https://github.com/YOUR-USERNAME/YOUR-REPOSITORY-NAME.git)
   cd YOUR-REPOSITORY-NAME
