module Functions (gcd',gcd'') where

import ChurchBool
import ChurchEq
import ChurchOrd
import ChurchNumeral

gcd' :: CNum -> CNum -> CNum
gcd' m n = cIf ((m .== zero) .|| (n .== zero))
    (cIf (m .== zero) n m)
    (cIf (n ./= m) 
        (cIf (n .<= m) (gcd' (cMod m n) n) (gcd' (cMod n m) m))
        m)

fix :: (a -> a) -> a
fix f = let {x = f x} in x

gcd'' :: CNum -> CNum -> CNum
gcd'' = fix (\fun m n ->
    cIf ((m .== zero) .|| (n .== zero))
        (cIf (m .== zero) n m)
        (cIf (n ./= m) 
            (cIf (n .<= m) (fun (cMod m n) n) (fun (cMod n m) m))
            m))