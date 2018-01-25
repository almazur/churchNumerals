

import Test.HUnit
import HUnitTests
import QCheckTests
import Test.QuickCheck

main :: IO ()
main = do 
    foldr (>>) (return ()) (fmap runTestTT tests)
    foldr (>>) (return ()) (fmap quickCheck prop_Laws)
    quickCheck prop_AssociativeLaw
    quickCheck prop_MulDistribVersusSub