{-# LANGUAGE RankNTypes #-}

-- | Church encoded Numerals equivalent and related functions
module ChurchNumeral (
        CNum,
        instCNum,
        zero,
        one,
        inc,
        dec,
        isZero,
        cDiv,
        cMod,
        cDivMod,
        (.^)
    ) where

    import Prelude
    import ChurchBool 
    import ChurchEq
    import ChurchOrd
    import Test.QuickCheck 

    -- type CNum a = (a -> a) -> a -> a
    -- doesn't work for higher rank types

    -- | Church Numeral data declaration
    data CNum = CNum {instCNum :: forall a. (a -> a) -> a -> a}

    -- | Church increment function
    inc :: CNum -> CNum
    inc (CNum n) = CNum (\f x -> f $ n f x)

    -- | Church decrement function
    dec :: CNum -> CNum
    dec (CNum n) = CNum (\f x -> n(\g -> \h -> h(g(f)))(\u -> x)(\u -> u))

    -- | Church isZero function, which returns Church Bool
    isZero :: CNum -> CBool
    isZero (CNum n) = n (\x -> cFalse)(cTrue)

    -- | Church encoded Zero
    zero :: CNum
    zero = CNum (\_ x -> x)

    -- | Church encoded One
    one :: CNum
    one = inc zero

    -- | returns Integer representation od Church
    toInteger :: CNum -> Int
    toInteger cNum = instCNum cNum (+1) $ 0

    -- | Church Modulo operator
    cMod :: CNum -> CNum -> CNum
    cMod m n = cIf (m .< n) (m) (cMod (m - n) n)

    -- | Church Divide operator
    cDiv :: CNum -> CNum -> CNum
    cDiv m n = cIf (m .< n) (zero) (one + cDiv (m - n) n)
    
    -- | Church Modulo and Divide operator, returns pair.
    cDivMod :: CNum -> CNum -> (CNum,CNum)
    cDivMod m n = (cDiv m n,cMod m n)

    -- | Church power operator
    (.^) :: CNum -> CNum -> CNum  
    base .^ exp = CNum {instCNum = (instCNum exp) (instCNum base)}

    -- | making Church instance of new CEq class
    instance CEq CNum where
        --m .== n = cAnd (isZero (m - n)) ((isZero ((n - m))))
        m .== n = (isZero (m - n)) .&& ((isZero (n - m)))

    -- | making Church instance of Eq class   
    instance Eq CNum where
        m == n = toBool (m .== n) 
    
    -- | making Church instance of new  COrd class       
    instance COrd CNum where
        m .<= n = (isZero (m - n))
 
    -- | making Church instance of Ord class
    instance Ord CNum where
        m <= n = toBool (m .<= n)

    -- | making Church instance of Show class    
    instance Show CNum where
        show (CNum n) = show $ n (+1) 0

    -- | making Church instance of Num class
    instance Num CNum where 
        x + y = instCNum x inc y
        x - y = instCNum y dec x
        (CNum x) * (CNum y) = CNum (x.y)
        abs n = n
        signum n = cIf (n .== zero) zero (inc zero)
        fromInteger i = if i == 0
            then zero
            else inc(fromInteger(abs(i)-1))

    -- | making Church instance of Arbitrary class  
    instance Arbitrary CNum where
        arbitrary = do
            Positive x <- arbitrary
            return $ fromInteger (x)