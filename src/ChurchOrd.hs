{-# LANGUAGE RankNTypes #-}

-- | Church encoded Ord class equivalent and related functions
module ChurchOrd
    (COrd,(.>),(.<),(.>=),(.<=),cMin,cMax
    ) where
import ChurchBool
import ChurchEq

-- | Church encoded Ord
-- | Minimal complete definition: .<=
class CEq c => COrd c where
    (.>) :: c -> c -> CBool
    (.<) :: c -> c -> CBool
    (.>=) :: c -> c -> CBool
    (.<=) :: c -> c -> CBool
    cMin :: c -> c -> c
    cMax :: c -> c -> c
    x .> y = cNot (x .<= y) 
    x .< y = (x .<= y) .&& (cNot (x .== y)) 
    x .>= y = cNot (x .< y)
    cMin x y = cIf (x .< y) x y
    cMax x y = cIf (x .< y) y x
    {-# MINIMAL (.<=) #-}
