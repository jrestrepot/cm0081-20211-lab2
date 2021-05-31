-- Regex-Posix Lazy Bytestring
module Main where

import System.Environment
import Data.Time
import qualified Data.ByteString.Lazy as L
import Text.Regex.Posix

-- First, Main reads two arguments through the command line, the file and the regular expression.
-- Then, Main prints whether the file matches the regex and how much time did it spend excecuting.
main :: IO ()
main = do
     start <- getCurrentTime
     file <- head <$> getArgs
     regex <- head . tail <$> getArgs
     content <- L.readFile file
     let result = content =~ regex :: Bool
     now <- getCurrentTime
     let exec_time = diffUTCTime now start
     putStrLn("Result: " ++ (show result))
     putStrLn("Time: " ++ (show exec_time))
