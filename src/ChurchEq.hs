{-# LANGUAGE RankNTypes #-}
module ChurchEq
    ((.==),(./=),CEq
    ) where
import ChurchBool

class CEq c where
    (.==) :: c -> c -> CBool
    (./=) :: c -> c -> CBool
    x .== y = cNot (x ./= y)
    x ./= y = cNot (x .== y)
    {-# MINIMAL (.==) | (./=) #-}

