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
       routeId' :: Int,
       serviceId :: String,
       tripId :: String,
       tripShortName :: String,
       tripHeadsign :: String,
       directionId :: Int,
       blockId :: Int,
       shapeId :: Int,
       bikesAllowed :: String,
       wheelchairAccessible :: String,
       tripType :: String
 } deriving Show

data StopTime = StopTime
 { 
       tripId' :: String,
       arrivalTime :: String,
       departureTime :: String,
       stopId :: Int,
       stopSequence :: String,
       stopHeadsign :: String,
       pickupType :: String,
       dropOffType :: String,
       shapeDistTraveled :: String,
       timepoint :: String,
       continuousPickup' :: String,
       continuousDropOff' :: String,
       pickupBookingRuleId :: String,
       dropOffBookingRuleId :: String,
       startPickupDropoffWindow :: String,
       endPickupDropoffWindow :: String,
       meanDurationFactor :: String,
       meanDurationOffset :: String,
       safeDurationFactor :: String,
       safeDurationOffset :: String
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

main :: IO ()
main = withConn "trips.db" $
             \conn ->  do
               resp <- query_ conn "SELECT * FROM routes;" :: IO [Route]
               mapM_ print resp
