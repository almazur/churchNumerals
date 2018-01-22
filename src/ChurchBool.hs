{-# LANGUAGE FlexibleInstances, RankNTypes, TypeFamilies  #-}
module ChurchBool
    (CBool,cTrue,cFalse,cNot,cAnd,cOr,cIf,toString
    ) where
type CBool = forall a. a -> a -> a

cTrue,cFalse :: CBool
--cTrue l _ = l
--cFalse _ r = r
cTrue true false = true
cFalse true false = false
--IMO czytelniej - Mateusz

--Logic operators
cNot :: CBool -> CBool
cNot a = a (cFalse) (cTrue)

cAnd :: CBool -> CBool -> CBool
cAnd x y = x y x

cOr :: CBool -> CBool -> CBool
cOr x y = x x y

cXor :: CBool -> CBool -> CBool
cXor x y = x (cNot y) y

-- syntactic sugar
cIf :: CBool -> CBool
--cIf cond = cond
cIf cond trueStat falseStat = cond (trueStat) (falseStat)
--IMO czytelniej - Mateusz

toString :: CBool -> String
toString b = b "cTrue" "cFalse"

-- wzięte stąd: https://gist.github.com/tmhedberg/1535396
-- TypeFamilies do ogarnięcia lub funkcja do zmiany i używamy powyższego toString
-- o TypeFamilies: https://wiki.haskell.org/GHC/Type_families
-- "in type theory is a partial function at the type level"
instance a ~ String => Show (a -> a -> a) where
    show cb = cb "cTrue" "cFalse"


--data CBool = CBool {instCBool :: forall a. a -> a -> a}

--cTrue,cFalse :: CBool
--cTrue = CBool (\t -> \_ -> t)
--cFalse = CBool (\_ -> \f -> f)

--eval :: CBool -> a -> a -> a
--eval (CBool cb) a b = cb a b

--cNot :: CBool -> CBool
--cNot a = instCBool a (cFalse) (cTrue)


--cAnd :: CBool -> CBool -> CBool
--cAnd x y = instCBool x(y)(x)
