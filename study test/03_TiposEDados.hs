-- 03_TiposEDados.hs
-- Exemplos de tipos de dados personalizados (data types), Pattern Matching e Maybe.

-- Definindo um tipo algébrico simples
data StatusPedido = Pendente | Enviado | Entregue | Cancelado
    deriving (Show, Eq)

-- Definindo um registro (Record Syntax)
data Produto = Produto
    { nome  :: String
    , preco :: Double
    } deriving (Show)

data ItemPedido = ItemPedido
    { produto    :: Produto
    , quantidade :: Int
    } deriving (Show)

-- Função com Pattern Matching
descreverStatus :: StatusPedido -> String
descreverStatus Pendente  = "O pedido está aguardando processamento."
descreverStatus Enviado   = "O pedido já está a caminho!"
descreverStatus Entregue  = "Pedido entregue com sucesso."
descreverStatus Cancelado = "O pedido foi cancelado."

-- Exemplo com tipo Maybe (tratamento seguro de ausência de valor)
divisaoSegura :: Double -> Double -> Maybe Double
divisaoSegura _ 0 = Nothing
divisaoSegura a b = Just (a / b)

main :: IO ()
main = do
    putStrLn "--- Tipos de Dados e Pattern Matching em Haskell ---"
    
    let p1 = Produto { nome = "Livro 'Learn You a Haskell'", preco = 79.90 }
    let item = ItemPedido { produto = p1, quantidade = 2 }
    
    putStrLn $ "Produto: " ++ nome (produto item)
    putStrLn $ "Quantidade: " ++ show (quantidade item)
    putStrLn $ "Total: R$ " ++ show (preco (produto item) * fromIntegral (quantidade item))
    
    let statusAtual = Enviado
    putStrLn $ "Status: " ++ descreverStatus statusAtual
    
    putStrLn "\n--- Teste de Divisão Segura (Maybe) ---"
    case divisaoSegura 10 2 of
        Just res -> putStrLn $ "10 / 2 = " ++ show res
        Nothing  -> putStrLn "Erro: divisão por zero!"
        
    case divisaoSegura 10 0 of
        Just res -> putStrLn $ "10 / 0 = " ++ show res
        Nothing  -> putStrLn "Erro: divisão por zero evitada com sucesso usando Maybe!"
