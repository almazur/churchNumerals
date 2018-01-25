{-# LANGUAGE RankNTypes #-}

-- | Church encoded Eq class equivalent and related functions
module ChurchEq
    ((.==),(./=),CEq
    ) where
import ChurchBool

-- | Church encoded Eq
-- | Minimal complete definition: either .== or ./=
class CEq c where
    (.==) :: c -> c -> CBool
    (./=) :: c -> c -> CBool
    x .== y = cNot (x ./= y)
    x ./= y = cNot (x .== y)
    {-# MINIMAL (.==) | (./=) #-}

