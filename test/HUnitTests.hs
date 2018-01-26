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
    caseC2 = TestCase (assertEqual "cTrue .&& cFalse == cFalse" cFalse (cTrue .&& cFalse))
    caseC3 = TestCase (assertEqual "cTrue .|| cFalse == cTrue" cTrue (cTrue .|| cFalse))
    caseC4 = TestCase (assertEqual "toBool cTrue == True" (toBool cTrue) (True))
    caseC5 = TestCase (assertEqual "fromBool False == cFalse" (fromBool False) (cFalse))

    testC :: Test
    testC = TestList [TestLabel "caseC1" caseC1,TestLabel "caseC2" caseC2,TestLabel "caseC3" caseC3]

    -- testcases for CEq,Egand COrd,Ord instances
    caseB1 = TestCase (assertEqual "zero .== zero" cTrue (zero .== zero))
    caseB2 = TestCase (assertEqual "inc zero .> zero == cTrue" cTrue (inc zero .> zero))
    caseB3 = TestCase (assertEqual "cMin (inc zero) zero == zero" zero (cMin (inc zero) zero))
    caseB4 = TestCase (assertEqual "zero < inc zero = True" (zero < inc zero) (True) )
    caseB5 = TestCase (assertEqual "one >= one = True" (one >= one) (True))

    testB :: Test
    testB = TestList [TestLabel "caseB1" caseB1, TestLabel "caseB2" caseB2,TestLabel "caseB3" caseB3,
        TestLabel "caseB4" caseB4,TestLabel "caseB5" caseB5]

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

    -- testcases for intSqrt
    caseE1 = TestCase (assertEqual "intSqrt zero == zero" (intSqrt zero) (zero)) 
    caseE2 = TestCase (assertEqual "intSqrt one == one" (intSqrt one) (one))
    caseE3 = TestCase (assertEqual "intSqrt three == one" (intSqrt $ fromInteger 3) (fromInteger 1)) 
    caseE4 = TestCase (assertEqual "intSqrt four == two" (intSqrt $ fromInteger 4) (fromInteger 2))
    caseE5 = TestCase (assertEqual "intSqrt five == two" (intSqrt $ fromInteger 5) (fromInteger 2))
    caseE6 = TestCase (assertEqual "intSqrt twenty == four " (intSqrt $ fromInteger 20) (fromInteger 4))
    caseE7 = TestCase (assertEqual "intSqrt twentyfive == five" (intSqrt $ fromInteger 25) (fromInteger 5))
    caseE8 = TestCase (assertEqual "intSqrt ninetynine == nine " (intSqrt $ fromInteger 99) ( fromInteger 9))
    caseE9 = TestCase (assertEqual "intSqrt onehundred == ten" (intSqrt $ fromInteger 100) (fromInteger 10))
    caseE10 = TestCase (assertEqual "intSqrt onehundredone == ten" (intSqrt $ fromInteger 101) (fromInteger 10))

    testE :: Test
    testE = TestList [TestLabel "caseE1" caseE1,TestLabel "caseE2" caseE2,TestLabel "caseE3" caseE3,
        TestLabel "caseE4" caseE4,TestLabel "caseE5" caseE5,TestLabel "caseE6" caseE6,TestLabel "caseE7" caseE7,
        TestLabel "caseE8" caseE8,TestLabel "caseE9" caseE9,TestLabel "caseE10" caseE10]

    tests :: [Test]
    tests = [testA,testB,testC,testD,testE]


