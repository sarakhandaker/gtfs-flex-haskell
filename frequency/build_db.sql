DROP TABLE IF EXISTS routes;
DROP TABLE IF EXISTS trips;
DROP TABLE IF EXISTS stop_times;

CREATE TABLE routes (
       agency_id INTEGER,
       route_id INTEGER PRIMARY KEY,
       route_short_name TEXT,
       route_long_name TEXT,
       route_desc TEXT,
       route_type TEXT,
       route_url TEXT, 
       route_color TEXT,
       route_text_color TEXT,
       route_sort_order TEXT,
       min_headway_minutes TEXT,
       eligibility_restricted TEXT,
       continuous_pickup TEXT,
       continuous_drop_off TEXT
       );
.separator ','
.headers on
.import  ../spec/Flex_v2_Example_3/routes.txt  routes

CREATE TABLE trips (
       route_id INTEGER,
       service_id TEXT,
       trip_id TEXT PRIMARY KEY,
       trip_short_name TEXT,
       trip_headsign TEXT,
       direction_id INTEGER,
       block_id INTEGER,
       shape_id INTEGER,
       bikes_allowed TEXT,
       wheelchair_accessible TEXT,
       trip_type TEXT
       );
.separator ','
.headers on
.import "|tail -n +2 ../spec/Flex_v2_Example_3/trips.txt" trips

CREATE TABLE stop_times (
       trip_id TEXT,
       arrival_time TEXT,
       departure_time TEXT,
       stop_id INTEGER,
       stop_sequence TEXT,
       stop_headsign TEXT,
       pickup_type TEXT,
       drop_off_type TEXT,
       shape_dist_traveled TEXT,
       timepoint TEXT,
       continuous_pickup TEXT,
       continuous_drop_off TEXT,
       pickup_booking_rule_id TEXT,
       drop_off_booking_rule_id TEXT,
       start_pickup_dropoff_window TEXT,
       end_pickup_dropoff_window TEXT,
       mean_duration_factor TEXT,
       mean_duration_offset TEXT,
       safe_duration_factor TEXT,
       safe_duration_offset TEXT
       );
.separator ','
-- .import  ../spec/Flex_v2_Example_3/stop_times.txt  stop_times
.import "|tail -n +2 ../spec/Flex_v2_Example_3/stop_times.txt" stop_times

-- BULK INSERT routes
-- FROM '../spec/Flex_v2_Example_3/routes.txt'
-- WITH 
--   (
--     FIRSTROW = 2,
--     FIELDTERMINATOR = ',',
--     ROWTERMINATOR = '\n',
--   );

-- INSERT INTO tools (name,description,lastReturned,timesBorrowed)
-- VALUES ('hammer','hits stuff','2017-01-01',0);

-- INSERT INTO tools (name,description,lastReturned,timesBorrowed)
-- VALUES ('saw','cuts stuff','2017-01-01',0);