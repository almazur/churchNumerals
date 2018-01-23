

import Test.HUnit
import HUnitTests
import QCheckTests
import Test.QuickCheck

main :: IO ()
main = do 
    foldr (>>) (return ()) (fmap runTestTT tests)
    quickCheck prop1
