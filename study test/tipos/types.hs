-- JA estavamos usando isso o tempo, o proprio string eh um Type String = [Char] 
type Produto =(Integer,String,Double)
type Cliente = (Integer, String, Double)

type Assoc k v = [(k, v)]
find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k', v) <- t, k' == k] -- vou procurano meu array associativa - toda dyupla que estiver igual a k quero ele

preco :: Produto -> Double
preco (_, _, p) = p 

pago:: Cliente -> Double 
pago (_, _, p) = p 

atualizaPreco :: Produto -> Double -> Produto 
atualizaPreco (idProd, nome,preco) inflacao = (idProd, nome, preco * (1 + inflacao))


troco :: Produto -> Cliente-> Double
troco p c = abs( pago c - preco p )

-- Tipo somma

data Bool = False | True

-- criando um novo tipo de dado (com o dda aque silnaliza a criancao) e o nome dele seria bool 

data Dir = Norte | Sul | Leste | Oeste deriving Show


--deriving: da a possbilidae de imprimir esse tipo 

type Coord = (Int, Int)
type Passo = Coord -> Coord

para :: Dir -> Passo
para Norte (x,y) = (x, y + 1)
para Sul (x,y) = (x, y - 1)
para Leste (x,y) = (x + 1, y)
para Oeste (x,y) = (x - 1, y)

caminhar :: [Dir] -> Passo
caminhar ds coord = foldl (flip para) coord ds 
-- foldl nada mais eh do que isso aqui 
-- caminhar [] coord = coord
-- caminhar (d:ds) coord = caminhar ds (para d coord)

