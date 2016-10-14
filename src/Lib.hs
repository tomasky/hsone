module Lib
    ( someFunc
    ,fun
    ) where

someFunc :: IO ()

someFunc = putStrLn "someFunc"

fun :: Int -> String -> String

fun a b = reverse ((showString b.shows a) "" )

