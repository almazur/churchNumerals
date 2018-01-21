module Main where

--import ChurchBool
--import ChurchEq
--import ChurchOrd
import ChurchNumeral
    
main :: IO ()
main = do
    let one = succ zero
    let two = one + one
    print (two)
