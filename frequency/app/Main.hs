{-# OPTIONS_GHC -Wno-deferred-type-errors #-}
module Main where
-- import Lib
import Control.Applicative
import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow
import Data.Time

withConn :: String -> (Connection -> IO ()) -> IO ()
withConn trips action = do
   conn <- open trips
   action conn
   close conn

data Route = Route
 { 
       agencyId :: Int,
       routeId :: Int,
       routeShortName  :: String,
       routeLongName  :: String,
       routeDesc  :: String,
       routeType  :: String,
       routeUrl  :: String, 
       routeColor  :: String,
       routeTextColor  :: String,
       routeSortOrder  :: String,
       minHeadwayMinutes :: String,
       eligibilityRestricted  :: String,
       continuousPickup  :: String,
       continuousDropOff  :: String
 } deriving Show

data Trip = Trip
 { 
       routeId' :: Maybe Int,
       serviceId :: String,
       tripId :: String,
       tripShortName :: Maybe String,
       tripHeadsign :: Maybe String,
       directionId :: Maybe Int,
       blockId :: Maybe Int,
       shapeId :: Maybe String,
       bikesAllowed :: Maybe String,
       wheelchairAccessible :: Maybe String,
       tripType :: Maybe String
 } deriving Show

data StopTime = StopTime
 { 
       tripId' :: String,
       arrivalTime :: String,
       departureTime :: String,
       stopId :: Maybe Int,
       stopSequence :: Maybe String,
       stopHeadsign :: Maybe String,
       pickupType :: Maybe String,
       dropOffType :: Maybe String,
       shapeDistTraveled :: Maybe String,
       timepoint :: Maybe String,
       continuousPickup' :: Maybe String,
       continuousDropOff' :: Maybe String,
       pickupBookingRuleId :: Maybe String,
       dropOffBookingRuleId :: Maybe String,
       startPickupDropoffWindow :: Maybe String,
       endPickupDropoffWindow :: Maybe String,
       meanDurationFactor :: Maybe String,
       meanDurationOffset :: Maybe String,
       safeDurationFactor :: Maybe String,
       safeDurationOffset :: Maybe String
 } deriving Show

instance FromRow Route where
   fromRow = Route <$> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field

instance FromRow Trip where
   fromRow = Trip <$> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field

instance FromRow StopTime where
   fromRow = StopTime <$> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field
                  <*> field

main :: IO ()
main = withConn "trips.db" $
             \conn ->  do
               resp <- query_ conn "SELECT * FROM trips;" :: IO [Trip]
               mapM_ print resp
