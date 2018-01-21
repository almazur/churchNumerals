{-# LANGUAGE RankNTypes #-}
module ChurchEq
    ((.==),CEq
    ) where
import ChurchBool
class CEq c where
    (.==) :: c -> c -> CBool
