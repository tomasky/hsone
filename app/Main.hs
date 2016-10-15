module Main where

import Lib


s = for [1..5] $ \x -> show x

main :: IO ()
main = do 
       print(s)
       print(fun e "b")
       where e = 3
