module QCheckTests (prop_Laws,prop_AssociativeLaw,prop_MulDistribVersusSub) 
where
import ChurchBool
import ChurchNumeral
import ChurchEq
import ChurchOrd
import Test.QuickCheck

-- Multiply Distribution law
prop_MulDistribVersusAdd :: CNum -> CNum -> CNum -> Bool
prop_MulDistribVersusAdd a b c = (a+b)*c == (a*c)+(b*c) 
--prop_MulDistribVersusSum :: CNum -> CNum -> CNum -> Bool
prop_MulDistribVersusSub a b c = (a > b) ==> ((a-b)*c == (a*c)-(b*c)) 


-- Associative law
prop_AssociativeLaw :: CNum -> CNum -> CNum -> Bool
prop_AssociativeLaw a b c = (a+b)+c == a+(b+c)

-- Commutativity Law
prop_CommutativityLaw :: CNum -> CNum -> Bool
prop_CommutativityLaw a b = a+b == b+a 


prop_Laws=[prop_MulDistribVersusAdd,prop_AssociativeLaw]


