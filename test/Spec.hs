

import Test.HUnit
import HUnitTests
import QCheckTests
import Test.QuickCheck

main :: IO ()
main = do 
    --foldr (>>) (return ()) (fmap runTestTT tests)
    
    --foldr (>>) (return ()) (fmap quickCheck prop_3)
    --foldr (>>) (return ()) (fmap quickCheck prop_2)
    --foldr (>>) (return ()) (fmap quickCheck prop_1)
    foldr (>>) (return ()) (fmap quickCheck prop_cBool1)
    foldr (>>) (return ()) (fmap quickCheck prop_cBool2)