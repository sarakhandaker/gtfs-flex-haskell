module Main where

-- import Lib
import Control.Applicative
import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow
import Data.Time

main :: IO ()
main = print "db-lesson"

withConn :: String -> (Connection -> IO ()) -> IO ()
withConn trips action = do
   conn <- open trips
   action conn
   close conn