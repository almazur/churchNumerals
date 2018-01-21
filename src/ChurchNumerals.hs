{-# LANGUAGE RankNTypes #-}

module ChurchNumerals () where
    import Prelude hiding (succ,pred,(*))
    import ChurchEq 
    import ChurchBool 

    --type CNum a = (a -> a) -> a -> a
    -- doesn't work for higher rank types
    data CNum = CNum {instCNum :: forall a. (a -> a) -> a -> a}

    isZero :: CNum -> CBool
    isZero (CNum n) = n (\x -> cFalse)(cTrue)

    instance CEq CNum where
        m .== n = cAnd (isZero (m .- n)) ((isZero ((n .- m))))

    zero :: CNum
    zero = CNum (\_ x -> x)

    succ :: CNum -> CNum
    succ (CNum n) = CNum (\f x -> f $ n f x)


    pred :: CNum -> CNum
    pred (CNum n) = CNum (\f x -> n(\g -> \h -> h(g(f)))(\u -> x)(\u -> u))

    --plus :: CNum -> CNum -> CNum
    --m `plus` n = instCNum n succ m

    (.+) :: CNum -> CNum -> CNum
    m .+ n = instCNum n succ m

    (.-) :: CNum -> CNum -> CNum
    m .- n = instCNum n pred m

    (.*) :: CNum -> CNum -> CNum
    (CNum m) .* (CNum n) = CNum (m.n)
--    POW = lambda m : lambda n : n(m)

    church :: Int -> CNum
    church i = if i == 0
        then zero
        else succ(church(i-1))

    instance Show CNum where
        show (CNum n) = show $ n (+1) 0
