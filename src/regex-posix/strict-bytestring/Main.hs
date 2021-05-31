-- Regex-Posix Bytestring Strict
module Main where

import System.Environment
import Data.Time
import Text.Regex.Posix
import qualified Data.ByteString as BS

main :: IO ()
main = do
    file <- head <$> getArgs
    regex <- head . tail <$> getArgs
    content <- BS.readFile file
    start <- getCurrentTime
    let result = content =~ regex :: Bool
    now <- getCurrentTime
    let exec_time = diffUTCTime now start
    print(result)
    print(exec_time)
