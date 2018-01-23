module QCheckTests (prop1) 
where
import ChurchBool
import ChurchNumeral
import ChurchEq
import ChurchOrd

prop1 :: CNum -> CNum -> Bool
prop1 m n = m * n == n * m


