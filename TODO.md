# TODO: Real World Haskell - Chapters 3 & 4 Exercises

**Deadline:** Wednesday, September 2, 2026 (Quarta-feira, 02/09/2026)

---

## 📋 Chapter 3 Exercises
- [ ] **Safe List Manipulation**
  - Implement list manipulation functions like `safeSecond` using `Maybe` types and pattern matching.
- [ ] **Palindrome Predicate**
  - Create a palindrome predicate for general lists (i.e., check if a list is equal to its reverse).
- [ ] **Sorting List of Lists**
  - Sort a list of lists by the length of each sublist (using `sortBy` and `compare`).
- [ ] **Intersperse Function**
  - Define the `intersperse` function (joins a list of lists using a separator).
- [ ] **Graham's Scan Algorithm**
  - Implement the Graham's scan algorithm to find the 2D convex hull of a set of points.

---

## 📋 Chapter 4 Exercises
- [ ] **Safe Partial Functions**
  - Implement safe versions of Prelude's partial functions:
    - `safeHead :: [a] -> Maybe a`
    - `safeTail :: [a] -> Maybe [a]`
    - `safeLast :: [a] -> Maybe a`
    - `safeInit :: [a] -> Maybe [a]`
- [ ] **SplitWith Function**
  - Create the `splitWith` function (splits a list according to a predicate).
- [ ] **Prelude Rewrites (using foldr/foldl')**
  - Rewrite the following Prelude functions using `foldr` or `foldl'`:
    - `concat`
    - `takeWhile`
    - `groupBy`
    - `any`
