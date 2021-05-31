-- Regex-Tdfa string
module Main where
import System.Environment
import Text.Regex.TDFA
import Data.Time

main :: IO()
main = do
    start <- getCurrentTime
    file <- head <$> getArgs
    regex <- head . tail <$> getArgs
    content <- readFile file
    let result = content =~ regex :: Bool
    now <- getCurrentTime
    let exec_time = diffUTCTime now start
    putStrLn("Result: " ++ (show result))
    putStrLn("Time: " ++ (show exec_time))
