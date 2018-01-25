{-# LANGUAGE FlexibleInstances, RankNTypes, TypeFamilies  #-}

-- | Church encoded Bool equivalent and related functions
module ChurchBool
    (CBool,cTrue,cFalse,cNot,(.&&),(.||),cIf,toString
    ) where

-- | Bool type eqivalent
type CBool = forall a. a -> a -> a

-- | Church encoded True
cTrue :: CBool
cTrue true false = true

-- | Church encoded False
cFalse :: CBool
cFalse true false = false

-- | Church encoded not
cNot :: CBool -> CBool
cNot a = a (cFalse) (cTrue)

-- | Church encoded and operator
(.&&) :: CBool -> CBool -> CBool
x .&& y = x y x

-- | Church encoded or operator
(.||) :: CBool -> CBool -> CBool
x .|| y = x x y

-- | Church encoded xor
cXor :: CBool -> CBool -> CBool
cXor x y = x (cNot y) y

-- | Syntactic sugar 
cIf :: CBool -> CBool
cIf cond trueStat falseStat = cond (trueStat) (falseStat)

-- | returns String representation of CBool
toString :: CBool -> String
toString b = b "cTrue" "cFalse"


{- | Eq instance for church Bool type;
Solution of the problem with writing Eq and Show instance taken from: https://gist.github.com/tmhedberg/1535396;
"in type theory is a partial function at the type level", more about TypeFamilies: https://wiki.haskell.org/GHC/Type_families-}
instance a ~ String => Eq (a -> a -> a) where
    b1 == b2 = (show b1) == (show b2)

-- | Show instance for church Bool
instance a ~ String => Show (a -> a -> a) where
    show cb = cb "cTrue" "cFalse"

