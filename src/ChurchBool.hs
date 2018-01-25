{-# LANGUAGE FlexibleInstances, RankNTypes, TypeFamilies  #-}

-- | Church encoded Bool equivalent and related functions
module ChurchBool(
        CBool,
        cTrue,
        cFalse,
        cNot,
        (.&&),
        (.||),
        cXor,
        cIf,
        toString,
        toBool,
        fromBool,
    ) where

    -- | Bool type eqivalent
    type CBool = forall a. a -> a -> a
    --data CBool = CBool {instCBool :: forall a. a -> a -> a}

    -- | Church encoded True
    cTrue :: CBool
    cTrue true false = true

    -- | Church encoded False
    cFalse :: CBool
    cFalse true false = false

    -- | Church encoded Not operator
    cNot :: CBool -> CBool
    cNot a = a (cFalse) (cTrue)

    -- | Church encoded And operator
    (.&&) :: CBool -> CBool -> CBool
    x .&& y = x y x

    -- | Church encoded Or operator
    (.||) :: CBool -> CBool -> CBool
    x .|| y = x x y

    -- | Church encoded Xor operator
    cXor :: CBool -> CBool -> CBool
    cXor x y = x (cNot y) y

    -- | Syntactic sugar 
    cIf :: CBool -> CBool
    cIf cond trueStat falseStat = cond (trueStat) (falseStat)

    -- | returns String representation of CBool
    toString :: CBool -> String
    toString b = b "cTrue" "cFalse"

    --returns Bool representation of CBool
    toBool :: CBool -> Bool
    toBool cb = cb True False

    --returns CBool representation of Bool
    fromBool :: Bool -> CBool
    fromBool b = if b then cTrue else cFalse

    {- | Eq instance for church Bool type;
    Solution of the problem with writing Eq and Show instance taken from: https://gist.github.com/tmhedberg/1535396;
    "in type theory is a partial function at the type level", more about TypeFamilies: https://wiki.haskell.org/GHC/Type_families-}
    instance a ~ String => Eq (a -> a -> a) where
        b1 == b2 = (show b1) == (show b2)

    -- | Show instance for church Bool
    instance a ~ String => Show (a -> a -> a) where
        show cb = cb "cTrue" "cFalse"

    {-
    instance a ~ Bool => Arbitrary (a -> a -> a) where
        arbitrary = do
            b <- arbitrary
            return $ fromBool (b)
    -}