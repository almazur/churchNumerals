{-# LANGUAGE FlexibleInstances, RankNTypes, TypeFamilies  #-}
module ChurchBool
    (CBool,cTrue,cFalse,cNot,cAnd,(.&&),cOr,(.||),cIf,toString
    ) where
type CBool = forall a. a -> a -> a

cTrue,cFalse :: CBool
cTrue true false = true
cFalse true false = false

--Logic operators
cNot :: CBool -> CBool
cNot a = a (cFalse) (cTrue)

cAnd :: CBool -> CBool -> CBool
cAnd x y = x y x

(.&&) :: CBool -> CBool -> CBool
x .&& y = x y x

cOr :: CBool -> CBool -> CBool
cOr x y = x x y

(.||) :: CBool -> CBool -> CBool
x .|| y = x x y

cXor :: CBool -> CBool -> CBool
cXor x y = x (cNot y) y

-- syntactic sugar
cIf :: CBool -> CBool
cIf cond trueStat falseStat = cond (trueStat) (falseStat)

toString :: CBool -> String
toString b = b "cTrue" "cFalse"



-- wzięte stąd: https://gist.github.com/tmhedberg/1535396
-- o TypeFamilies: https://wiki.haskell.org/GHC/Type_families
-- "in type theory is a partial function at the type level"
instance a ~ String => Show (a -> a -> a) where
    show cb = cb "cTrue" "cFalse"

instance a ~ String => Eq (a -> a -> a) where
    b1 == b2 = (show b1) == (show b2)

