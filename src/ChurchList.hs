{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE ViewPatterns #-}
module ChurchList (
    cPair ,cLeft,cRight,
    cEmpty,isEmpty,addToCList,cHead,cTail)where
    import ChurchBool 


    --Pair, where we can store two values is good way to build a list

    --cPair :: forall r. r -> r -> (r -> r -> a) -> a

    --newtype CPair = CPair { instcPair :: forall a b c. a -> b  (a -> b -> c) -> c} 

    --newtype CPair = CPair { instcPair :: forall lt rt a. lt -> rt -> (lt -> rt -> a) -> a} 

    --newtype CPair lt rt a = CPair { instcPair :: lt -> rt -> (lt -> rt -> a) -> a} 

    --cPair :: CPair
    cPair :: forall lt rt a. lt -> rt -> (lt -> rt -> a) -> a
    cPair left rigt f = f(left)(rigt) 
    -- We can use ChurchBool, because cTrue i cFalse gets left or right argument of function :)\
    cLeft cpair = cpair (cTrue)

    cRight cpair = cpair (cFalse)

    --Linked list.
    --Pair is a node, where on the Right we store value and on the Left we store pointer to next Pair
    newtype CList a = CList { instList :: forall r. (a -> r -> r) -> r -> r } 

    --cEmpty :: CList
    cEmpty = cPair (cTrue) (cTrue) 

    isEmpty = cLeft 

    addToCList element cList = cPair (cFalse) (cPair(element)(cList))

    cHead cList = cLeft(cRight(cList))

    cTail cList = cRight(cRight(cList))

    --cList conversion 
    --fromCList cEmpty = []
    --fromCList cList = [cHead cList] ++ (fromCList (cTail cList)) 

    -- NIC NIE DZIAŁA :<<