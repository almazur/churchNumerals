module HUnitTests (tests) 
where
import ChurchBool
import ChurchNumeral
import ChurchEq
import ChurchOrd
import Functions
import Test.HUnit

-- testcases for basic church numerals operations
caseA1 = TestCase (assertEqual "fromInteger 0 == zero" zero (fromInteger 0))
caseA2 = TestCase (assertEqual "(fromInteger 1) == inc 0" (fromInteger 1) (inc 0))
caseA3 = TestCase (assertEqual "show zero == 0" (show 0) (show zero))
caseA4 = TestCase (assertEqual "dec (inc zero) == zero" zero (dec (inc zero)))
caseA5 = TestCase (assertEqual "one cDivMod two = (zero,one)" (zero,inc zero) (cDivMod (inc zero) (inc (inc zero))))
caseA6 = TestCase (assertEqual "isZero zero = cTrue" cTrue (isZero zero))
caseA7 = TestCase (assertEqual "isZero one = cFalse" cFalse (isZero (inc zero)))

testA :: Test
testA = TestList [TestLabel "caseA1" caseA1, TestLabel "caseA2" caseA2,TestLabel "caseA3" caseA3,
    TestLabel "caseA4" caseA4,TestLabel "caseA5" caseA5, TestLabel "caseA6" caseA6,
    TestLabel "caseA7" caseA7]

-- testcases for CBool
caseC1 = TestCase (assertEqual "cNot cTrue == cFalse" cFalse (cNot cTrue))
caseC2 = TestCase (assertEqual "cAnd cTrue cFalse == cFalse" cFalse (cAnd cTrue cFalse))
caseC3 = TestCase (assertEqual "cOr cTrue cFalse == cTrue" cTrue (cOr cTrue cFalse))

testC :: Test
testC = TestList [TestLabel "caseC1" caseC1,TestLabel "caseC2" caseC2,TestLabel "caseC3" caseC3]

-- testcases for CEq and COrd instances
caseB1 = TestCase (assertEqual "zero .== zero" cTrue (zero .== zero))
caseB2 = TestCase (assertEqual "inc zero .> zero == cTrue" cTrue (inc zero .> zero))
caseB3 = TestCase (assertEqual "cMin (inc zero) zero == zero" zero (cMin (inc zero) zero))

testB :: Test
testB = TestList [TestLabel "caseB1" caseB1, TestLabel "caseB2" caseB2,TestLabel "caseB3" caseB3]

-- testcases for gcd' and gcd''
caseD1 = TestCase (assertEqual "gcd' twenty fifteen == five" (fromInteger 5) (gcd' (fromInteger 20) (fromInteger 15)))
caseD2 = TestCase (assertEqual "gcd'' twenty fifteen == five" (fromInteger 5) (gcd'' (fromInteger 20) (fromInteger 15)))
caseD3 = TestCase (assertEqual "gcd' three four == one" (fromInteger 1) (gcd' (fromInteger 3) (fromInteger 4)))
caseD4 = TestCase (assertEqual "gcd'' three four == one" (fromInteger 1) (gcd'' (fromInteger 3) (fromInteger 4)))
caseD5 = TestCase (assertEqual "gcd' two zero == two" (fromInteger 2) (gcd' (fromInteger 2) zero))
caseD6 = TestCase (assertEqual "gcd'' two zero == two" (fromInteger 2) (gcd'' (fromInteger 2) zero))

testD :: Test
testD = TestList [TestLabel "caseD1" caseD1, TestLabel "caseD2" caseD2,TestLabel "caseD3" caseD3,
    TestLabel "caseD4" caseD4,TestLabel "caseD5" caseD5, TestLabel "caseD6" caseD6]

tests :: [Test]
tests = [testA,testB,testC,testD]


