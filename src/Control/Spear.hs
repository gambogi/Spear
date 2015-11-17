{-|
Module      : Control.Spear
Description : Thicker Arrows
Copyright   : Matt Gambogi, Travis Whitaker 2015
License     : MIT
Maintainer  : m@gambogi.com
Stability   : Provisional
Portability : Portable

Thicker Arrows.
-}

{-# LANGUAGE DefaultSignatures, TypeFamilies #-}

module Control.Spear where

import Control.Arrow

class Arrow s => Spear (s :: * -> * -> *) where
    type ParamSpace s :: *
    type instance ParamSpace s = ()

    type Observation s :: *
    type instance Observation s = ()

    applySpear :: ParamSpace s -> s a b
    train      :: ParamSpace s -> Observation s -> ParamSpace s

    default applySpear :: ParamSpace s -> s a a
    applySpear _ = arr id

    train = const

(<^>) :: Spear s => ParamSpace s -> s a b
(<^>) = applySpear
