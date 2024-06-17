module Main where

import Example (example)
import Ourlude


data StagedError = StagedError String String

stageEither :: Show e => String -> Either e a -> Either StaggedError a
stageEither name m = case m of
                          Left e -> (StagedError name (show e))
                          Right a -> Right a
                          

main :: IO ()
main = putStrLn <| example
