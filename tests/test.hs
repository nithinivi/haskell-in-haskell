module Main where

import Test.Tasty ( defaultMain, testGroup, TestTree )
import Test.Tasty.HUnit ( testCase, (@?=), assertBool )
import Ourlude ()


main :: IO ()
main = defaultMain tests




tests :: TestTree
tests = testGroup "Ourlude"
    [ testCase "foldMap show [1 2 3 ] =  \"123\"" $
        foldMap show [1 , 2, 3] @?= "123"
    ]
