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
    
    import Prelude
    import Test.QuickCheck.Arbitrary
    
    -- | Bool type eqivalent
    --type CBool = forall a. a -> a -> a
    data CBool = CBool {instCBool :: forall a. a -> a -> a}

    -- | Church encoded True
    cTrue :: CBool
    cTrue = CBool (\true false -> true)

    -- | Church encoded False
    cFalse :: CBool
    cFalse = CBool (\true false -> false)

    -- | Church encoded Not operator
    cNot :: CBool -> CBool
    cNot cb = (instCBool cb) (cFalse) (cTrue)

    -- | Church encoded And operator
    (.&&) :: CBool -> CBool -> CBool
    x .&& y = (instCBool x) y x

    -- | Church encoded Or operator
    (.||) :: CBool -> CBool -> CBool
    x .|| y = (instCBool x) x y

    -- | Church encoded Xor operator
    cXor :: CBool -> CBool -> CBool
    cXor x y = (instCBool x) (cNot y) y

    -- | If statement
    cIf :: CBool -> stat -> stat -> stat
    cIf cond trueStat falseStat = (instCBool cond) trueStat falseStat

    -- | returns String representation of CBool
    toString :: CBool -> String
    toString cb = (instCBool cb) "cTrue" "cFalse"

    -- | returns Bool representation of CBool
    toBool :: CBool -> Bool
    toBool cb = (instCBool cb) True False

    -- | returns CBool representation of Bool
    fromBool :: Bool -> CBool
    fromBool b = if b then cTrue else cFalse

    instance Eq CBool where
        cb1 == cb2 = (show cb1) == (show cb2)

    -- | Show instance for church Bool
    instance Show CBool where
        show cb = (instCBool cb) "cTrue" "cFalse"
    
    instance Arbitrary CBool where
        arbitrary = do
            x <- arbitrary
            return $ fromBool (x)


    {- Eq instance for church Bool type;
    Solution of the problem with writing Eq and Show instance taken from: https://gist.github.com/tmhedberg/1535396;
    "in type theory is a partial function at the type level", more about TypeFamilies: https://wiki.haskell.org/GHC/Type_families-}
