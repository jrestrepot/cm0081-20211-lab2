-- Regex-Tdfa string
module Main where
import System.Environment
import Text.Regex.TDFA
import Data.List
import Data.Time

main :: IO()
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