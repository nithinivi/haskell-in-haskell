module Ourlude
  (
    module Prelude,
    (|>),
    (<|),
    (>>>),
    (<<<),
    foldMapM,
    mapLeft,
    first,
    second
  )
where

import Data.Bifunctor (first, second)
import Prelude 


infixl 1 |>
(|>) :: a -> (a -> b) -> b
x |> f = f x
{-# INLINE (|>) #-}

infixr 0 <|
(<|) :: (a -> b) -> a -> b
(<|) = ($)
{-# INLINE (<|) #-}

infixr 9 <<<
(<<<) :: (b -> c) -> (a -> b) -> (a -> c)
g <<< f = g . f
{-# INLINE (<<<) #-}

infixl 9 >>>
(>>>) :: (a -> b) -> (b -> c) -> (a -> c)
f >>> g = g . f
{-# INLINE (>>>) #-}


-- Map over a list monadically, then squash the results monoidally
foldMapM :: (Monad m, Monoid b) => (a -> m b) -> [a] -> m b
foldMapM f = mapM f >>> fmap mconcat


-- Transform an either by mapping on its left side
mapLeft :: (e -> e') -> Either e a -> Either e' a
mapLeft f = either (f >>> Left) Right
