module Main where

import ChurchBool
import ChurchEq
import ChurchOrd
import ChurchNumeral
import ChurchList
    
main :: IO ()
main = do
    let one = inc zero
    let two = one + one
    let three = fromInteger 3
    let four = two*two
    print ("4 < 1 ?")
    print (four .< one)
    print ("signum 2")
    print (signum two)
    print ("4 - 3 == 1")
    print (toString((four - three) .== one))
