-- Regex-Posix String
module Main where

import System.Environment
import Data.Time
import Text.Regex.Posix


-- First, Main reads two arguments through the command line, the file and the regular expression.
-- Then, Main prints whether the file matches the regex and how much time did it spend excecuting.
main :: IO ()
main = do
    file <- head <$> getArgs
    regex <- head . tail <$> getArgs
    content <- readFile file
    start <- getCurrentTime
    let result = content =~ regex :: Bool
    now <- getCurrentTime
    let exec_time = diffUTCTime now start
    print(result)
    print(exec_time)
    
