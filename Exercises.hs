module Exercises where 

-- 2.1 a 
listA :: [Integer] 
listA = [11^x | x <- [0..6]]

--2.2 b) 

listB :: [Int]
listB = [x | x <- [1..39], x `mod` 4 /= 0]

-- 2.1 c) 
listC :: [String]
listC = [ 'A' : x : "BB" | x <- ['a'..'g']]

-- 2.1 d)
listD :: [Int]
listD = [x | x <- [5,8..41], x `notElem` [14, 23, 35]]

--listD = [ x | x <- [5,8..41], x /= 14, x /= 23, x /= 35] -> repeticoes desnecassarias apesar de funcionar, existe o "not element"

-- 2.1 e)

-- [ EXPRESSÃO_DE_SAIDA | variável <- LISTA_DE_VALORES ]

listE :: [Double]   
listE = [0.5^x | x <- [0..5]]

-- 2.1 f)
listF :: [Int]
listF = [1,10..64]

-- 2.1 g)
listG :: [Int]
listG = [x | x <- [x*2 | x <- [1..15]], notElem x [6, 14, 20, 26]]

-- 2.1 h)
listH :: [Char]
listH = [ x | x <- ['@'..'L'], x `notElem` ['B', 'F', 'H', 'I', 'K']] 

--
--
--

ehPar :: String -> Bool
ehPar x = length x `mod` 2 == 0

reverseString :: [String] -> [String]   
reverseString x = reverse x 


-- 2.4
tamanhoString:: [String] -> [Int]
tamanhoString x = [length s | s <- x, length s `mod` 2 /= 0]
-- 2.5
myHead :: [a] -> a
myHead = last . reverse 

--2.6
palindrome :: String -> Bool 
palindrome x = x == reverse x

--2.7

multiple :: Int -> (Int, Int, Int, Int)
multiple x = (x*2, x*3, x*4, x*5) 