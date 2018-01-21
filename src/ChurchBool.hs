{-# LANGUAGE RankNTypes #-}
module ChurchBool
    (CBool,cTrue,cFalse,cNot,cAnd,cOr,cIf
    ) where
type CBool = forall a. a -> a -> a

cTrue,cFalse :: CBool
cTrue l _ = l
cFalse _ r = r

cNot :: CBool -> CBool
cNot a = a (cFalse) (cTrue)

cAnd :: CBool -> CBool -> CBool
cAnd x y = x y x

cOr :: CBool -> CBool -> CBool
cOr x y = x x y

-- syntactic sugar
cIf :: CBool -> CBool
cIf cond = cond


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
