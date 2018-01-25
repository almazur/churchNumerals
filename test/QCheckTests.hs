module QCheckTests (
        prop_3,
        prop_2,
        prop_1,
        prop_cBool1,
        prop_cBool2
    ) where
    import ChurchBool
    import ChurchNumeral
    import ChurchEq
    import ChurchOrd
    import Test.QuickCheck
    import Test.QuickCheck.Property
    import Test.QuickCheck.Function
    import Test.QuickCheck.All

    -- Multiply Distribution law
    prop_MulDistributionVersusAdd a b c = (a+b)*c == (a*c)+(b*c) 
        where types = (a::CNum, b::CNum, c::CNum)
    prop_MulDistributionVersusSub a b c = ((a-b)*c == (a*c)-(b*c)) 
        where types = (a::CNum, b::CNum, c::CNum)

    -- Associative law
    prop_AssociativeLawAdd a b c = (a+b)+c == a+(b+c)
        where types = (a::CNum, b::CNum, c::CNum)

    prop_AssociativeLawSub a b c = (a-b)-c == a-(b+c)
        where types = (a::CNum, b::CNum, c::CNum)       

    prop_3=[prop_MulDistributionVersusAdd,prop_MulDistributionVersusSub,prop_AssociativeLawAdd,prop_AssociativeLawSub]

    -- Commutativity Law
    prop_MulCommutativityLaw a b = a*b == b*a 
        where types = (a::CNum,b::CNum)
    prop_AddCommutativityLaw a b = a+b == b+a 
        where types = (a::CNum,b::CNum)

    prop_2=[prop_MulCommutativityLaw,prop_AddCommutativityLaw]

    --Sum Div and Mod
    --prop_SumDivMod a = a == (cDiv a + (cMod a))
    --    where types = (a::CNum)

    --Increment and sum equivalence
    prop_IncSumEq a = inc a == a+one
        where types = (a::CNum)

    --Decrement and sub equivalence
    prop_DecSubEq a =  dec a == a-one
        where types = (a::CNum)

    --Multiply neutral element
    prop_MulOne a = a*one == a
        where types = (a::CNum)

    --Addition neutral element
    prop_AddZero a = a+zero == a
        where types = (a::CNum)

    --isZero
    prop_isZero a = if (a == zero) then (isZero a == cTrue) else (isZero a == cFalse) 
        where types = (a::CNum)
        
    --Power
    prop_Power1 a = a .^ zero == one
        where types = (a::CNum)
    prop_Power2 a = a .^ one == a
        where types = (a::CNum)

    prop_1=[prop_IncSumEq,prop_DecSubEq,prop_MulOne,prop_AddZero,prop_isZero,prop_Power1,prop_Power2,prop_isZero]

    --double not
    prop_Not a = (fromBool a) == cNot (cNot (fromBool a))
        where types = (a::Bool)

    --And
    prop_And1 a = ((fromBool a) .&& cFalse) == cFalse
        where types = (a::Bool)
    prop_And2 a = ((fromBool a) .&& cTrue) == a
        where types = (a::Bool)        
    --Or
    prop_Or1 a = ((fromBool a) .|| cFalse) == a
        where types = (a::Bool)
    prop_Or2 a = ((fromBool a) .|| cTrue) == cTrue
        where types = (a::Bool)
    --Xor
    prop_Xor1 a = ((fromBool a) `cXor` (fromBool a)) ==cFalse  
        where types = (a::Bool)
    prop_Xor2 a = ((fromBool a) `cXor` cFalse) == a  
        where types = (a::Bool)        

    prop_cBool1=[prop_Not,prop_And1,prop_And2,prop_Or1,prop_Or2,prop_Xor1,prop_Xor2]

    {-}
    --Xor
    prop_Xor3 a b = (fromBool a) cXor (fromBool b) == (cNot(fromBool a) .&& (fromBool b)) .|| ((fromBool a) .&& cNot(fromBool b))
        where types = (a::Bool, b::Bool)
    prop_Xor4 a b = cNot((fromBool a) cXor (fromBool b)) == ((fromBool a) .&& (fromBool b)) .|| (cNot(fromBool a) .&& cNot(fromBool b))
        where types = (a::Bool, b::Bool)  
    de Morgane Law
    prop_DeMorgane1 a b = cNot ((fromBool a) .|| (fromBool b)) == (cNot (fromBool a)) .&& (cNot (fromBool b))
        where types = (a::Bool, b::Bool)
    prop_DeMorgane2 a b = cNot ((fromBool a) .&& (fromBool b)) == (cNot (fromBool a)) .|| (cNot (fromBool b))
        where types = (a::Bool, b::Bool)

    prop_cBool2=[prop_Xor3,prop_DeMorgane1,prop_DeMorgane2]        
    -}