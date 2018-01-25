module Main where

import ChurchBool
import ChurchEq
import ChurchOrd
import ChurchNumeral
import Functions

    
main :: IO ()
main = do
    print (gcd' (fromInteger 20) (fromInteger 15))
    print (gcd'' (fromInteger 20) (fromInteger 15))
    print (intSqrt (fromInteger 20))
