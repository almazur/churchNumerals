module HUnitTests (tests) 
where
import ChurchBool
import ChurchNumeral
import ChurchEq
import ChurchOrd
import Test.HUnit

test1 = TestCase (assertEqual "fromInteger 0 == zero" zero (fromInteger 0))
test2 = TestCase (assertEqual "(fromInteger 1) == inc 0" (fromInteger 1) (inc 0))
test3 = TestCase (assertEqual "zero .== zero" cTrue (zero .== zero))
test4 = TestCase (assertEqual "zero .< zero" cFalse (zero .< zero))

tests :: Test
tests = TestList [TestLabel "test1" test1, TestLabel "test2" test2,TestLabel "test3" test3, TestLabel "test4" test4]

