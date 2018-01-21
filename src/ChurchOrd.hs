{-# LANGUAGE RankNTypes #-}
module ChurchOrd
    (COrd,(.>),(.<),(.>=),(.<=),cMin,cMax
    ) where
import ChurchBool
import ChurchEq

class CEq c => COrd c where
    --ewentualnie: cCompare :: a -> a -> Ordering
    (.>) :: c -> c -> CBool
    (.<) :: c -> c -> CBool
    (.>=) :: c -> c -> CBool
    (.<=) :: c -> c -> CBool
    cMin :: c -> c -> c
    cMax :: c -> c -> c
    x .> y = cNot (x .<= y)
    x .< y = cAnd (x .<= y) (cNot (x .== y)) 
    x .>= y = cNot (x .< y)
    cMin x y = cIf (x .< y) x y
    cMax x y = cIf (x .< y) y x
    {-# MINIMAL (.<=) #-} -- ewentualnie {-# MINIMAL (.<=) | compare #-}
