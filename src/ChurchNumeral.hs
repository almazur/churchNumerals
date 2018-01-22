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

    one :: CNum
    one = inc zero

    -- instances, zakomentowane te ze naszymi operatorami
    instance CEq CNum where
        --m .== n = cAnd (isZero (m .- n)) ((isZero ((n .- m))))
        m .== n = cAnd (isZero (m - n)) ((isZero ((n - m))))
    
    instance Eq CNum where
        m == n = (m .== n) True False
    
    instance COrd CNum where
        --m .<= n = (isZero (m .- n))
        m .<= n = (isZero (m - n))
    
    instance Show CNum where
        show (CNum n) = show $ n (+1) 0

    instance Num CNum where 
        x + y = instCNum x inc y
        x - y = instCNum y dec x
        (CNum x) * (CNum y) = CNum (x.y)
        abs n = n
        signum n = cIf (n .== zero) zero (inc zero)
        fromInteger i = if i == 0
            then zero
            else inc(fromInteger(i-1))
  
    churchToInteger :: CNum -> Int
    churchToInteger cNum = instCNum cNum (+1) $ 0

    cMod :: CNum -> CNum -> CNum
    cMod m n = cIf (m .< n) (m) (cMod (m - n) n)

    cDiv :: CNum -> CNum -> CNum
    cDiv m n = cIf (m .< n) (zero) (one + cDiv (m - n) n)
    
    cDivMod m n = (cDiv m n,cMod m n)

    --(.^) :: CNum -> CNum -> CNum  
    --base .^ exp = (instCNum exp) (instCNum base)
    --IMO takie nazwy czytelnie pokazują co się dzieje - Mateusz
    --error :<
    --      Couldn't match expected type ‘CNum’
    --      with actual type ‘(a0 -> a0) -> a0 -> a0’


    --Rozumiem że to już niepotrzebne :)
    {-
    (.+) :: CNum -> CNum -> CNum
    m .+ n = instCNum n inc m

    (.-) :: CNum -> CNum -> CNum
    m .- n = instCNum n dec m

    (.*) :: CNum -> CNum -> CNum
    (CNum m) .* (CNum n) = CNum (m.n)

    church :: Int -> CNum
    church i = if i == 0
        then zero
        else inc(church(i-1))
    -}