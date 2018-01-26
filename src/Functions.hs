
-- | Some easy functions based on Church Numerals and Church Bool
module Functions (
        gcd',
        gcd'',
        intSqrt
    ) where

    import ChurchBool
    import ChurchEq
    import ChurchOrd
    import ChurchNumeral

    -- | Greatest common divisor 
    gcd' :: CNum -> CNum -> CNum
    gcd' m n = cIf ((m .== zero) .|| (n .== zero))
        (cIf (m .== zero) n m)
        (cIf (n ./= m) 
            (cIf (n .<= m) (gcd' (cMod m n) n) (gcd' (cMod n m) m))
            m)

    -- | Fixed point operator       
    fix :: (a -> a) -> a
    fix f = let {x = f x} in x

    -- | Greatest common divisor by lambda
    gcd'' :: CNum -> CNum -> CNum
    gcd'' = fix (\fun m n ->
        cIf ((m .== zero) .|| (n .== zero))
            (cIf (m .== zero) n m)
            (cIf (n ./= m) 
                (cIf (n .<= m) (fun (cMod m n) n) (fun (cMod n m) m))
                m))

    -- | Integer square as sum of even numbers
    intSqrt :: CNum -> CNum
    intSqrt m = intSqrtHelp m zero one zero
        where 
            intSqrtHelp m base term sum = 
                cIf(m.<(sum+term)) 
                    base 
                --else    
                    (intSqrtHelp m (inc base) (inc $ inc term) (sum+term))
