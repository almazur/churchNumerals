module Main where

import ChurchBool
import ChurchEq
import ChurchOrd
import ChurchNumeral
import ChurchList
    
main :: IO ()
main = do
    let num = instCNum (fromInteger 4) (+3) 5
    print (num)
