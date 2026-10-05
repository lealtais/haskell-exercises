-- 04_Interativo.hs
-- Exemplo de entrada e saída (I/O) interativa pelo terminal.

module Main where

import System.IO (hFlush, stdout)

main :: IO ()
main = do
    putStrLn "=========================================="
    putStrLn "   Bem-vindo ao Programa Interativo!      "
    putStrLn "=========================================="
    
    putStr "Qual é o seu nome? "
    hFlush stdout
    nome <- getLine
    
    putStrLn $ "Muito prazer, " ++ nome ++ "!"
    
    putStr "Digite seu ano de nascimento: "
    hFlush stdout
    anoStr <- getLine
    
    let ano = read anoStr :: Int
    let idadeAproximada = 2026 - ano
    
    putStrLn $ "Em 2026, você tem ou fará aproximadamente " ++ show idadeAproximada ++ " anos."
    putStrLn "Obrigado por testar o Haskell!"
