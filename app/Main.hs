module Main where

import ChurchBool
import ChurchEq
import ChurchOrd
import ChurchNumeral
import Functions

    
main :: IO ()
main = do
    putStrLn "**Najwiekszy wspolny dzielnik**"
    putStrLn "Podaj pierwsza liczbe: "
    line <- getLine
    let num1 = read line
    putStrLn "Podaj druga liczbe: "
    line <- getLine 
    let num2 = read line   
    putStrLn "Ich najwiekszy wspolny dzielnik to: "
    print (gcd' (fromInteger num1) (fromInteger num2))
    --print (gcd'' (fromInteger l1) (fromInteger l2))
    wait <- getLine
    
    putStrLn "**Pierwiastek calkowitoliczbowy**"
    putStrLn "Podaj liczbe: "
    line <- getLine
    let num3 = read line
    putStrLn "Jej pierwiastek calkowitoliczbowy to: "
    print (intSqrt (fromInteger num3))