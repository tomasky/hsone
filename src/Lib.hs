module Lib
    ( someFunc
    ,fun
    ,for
    ) where

someFunc :: IO ()

someFunc = putStrLn "someFunc"

fun :: Int -> String -> String

fun a b = reverse ((showString b.shows a) "" )

for array func = map func array

