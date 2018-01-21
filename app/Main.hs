module Main where

import ChurchBool
import ChurchEq
import ChurchNumerals
    
main :: IO ()
main = do
    print ((cTrue) "lewy" "prawy")
