{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}
module Lexer where
import Ourlude ( Eq, Show, String, Either(Left) )

data LexerError = UnimplementedError deriving (Eq, Show)
data Token = NoTokenYet deriving (Eq, Show)


lexer :: String -> Either LexerError [Token]
lexer _ = Left UnimplementedError



