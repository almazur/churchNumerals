{-# LANGUAGE RankNTypes #-}
module ChurchNumeral ((.==),zero,inc) where
    import Prelude
    import ChurchBool 
    import ChurchEq
    import ChurchOrd 

    --type CNum a = (a -> a) -> a -> a
    -- doesn't work for higher rank types
    data CNum = CNum {instCNum :: forall a. (a -> a) -> a -> a}

    -- basic operations
    inc :: CNum -> CNum
    inc (CNum n) = CNum (\f x -> f $ n f x)

    dec :: CNum -> CNum
    dec (CNum n) = CNum (\f x -> n(\g -> \h -> h(g(f)))(\u -> x)(\u -> u))

    -- zero numeral
    isZero :: CNum -> CBool
    isZero (CNum n) = n (\x -> cFalse)(cTrue)

    zero :: CNum
    zero = CNum (\_ x -> x)

    -- instances
    instance CEq CNum where
        m .== n = cAnd (isZero (m .- n)) ((isZero ((n .- m))))
    
    instance COrd CNum where
        m .<= n = (isZero (m .- n))
    
    instance Show CNum where
        show (CNum n) = show $ n (+1) 0

    --instance Num CNum where 
    --    x + y = instCNum n inc m
    --    x - y = instCNum n dec m

    

    --(.+) :: CNum -> CNum -> CNum
    --m .+ n = instCNum n inc m

    (.-) :: CNum -> CNum -> CNum
    m .- n = instCNum n dec m

    (.*) :: CNum -> CNum -> CNum
    (CNum m) .* (CNum n) = CNum (m.n)

    --  TODO:  POW = lambda m : lambda n : n(m)

    church :: Int -> CNum
    church i = if i == 0
        then zero
        else inc(church(i-1))
