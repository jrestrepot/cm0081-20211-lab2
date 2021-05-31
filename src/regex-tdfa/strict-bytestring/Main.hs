-- Regex-Tdfa ByteString
module Main where
import System.Environment
import Text.Regex.TDFA
import Data.Time
import qualified Data.ByteString as BS

main :: IO()
main = do
    start <- getCurrentTime
    file <- head <$> getArgs
    regex <- head . tail <$> getArgs
    content <- BS.readFile file
    let result = content =~ regex :: Bool
    now <- getCurrentTime
    let exec_time = diffUTCTime now start
    putStrLn("Result: " ++ (show result))
    putStrLn("Time: " ++ (show exec_time))
