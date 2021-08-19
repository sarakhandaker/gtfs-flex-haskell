DROP TABLE IF EXISTS routes;
DROP TABLE IF EXISTS trips;
DROP TABLE IF EXISTS stop_times;

CREATE TABLE routes (
       id INTEGER PRIMARY KEY,
       agency_id INTEGER,
       route_id INTEGER,
       route_short_name TEXT,
       route_long_name TEXT,
       route_desc TEXT,
       route_type TEXT,
       route_url TEXT, 
       route_color TEXT,
       route_text_color TEXT,
       route_sort_order TEXT,
       min_headway_minutes INTEGER,
       eligibility_restricted TEXT,
       continuous_pickup TEXT,
       continuous_drop_off TEXT
       );

CREATE TABLE trips (
       id INTEGER PRIMARY KEY,
       route_id INTEGER,
       service_id INTEGER,
       trip_id INTEGER,
       trip_short_name TEXT,
       trip_headsign TEXT,
       direction_id INTEGER,
       block_id INTEGER,
       shape_id INTEGER,
       bikes_allowed TEXT,
       wheelchair_accessible TEXT,
       trip_type TEXT
       );

CREATE TABLE stop_times (
       id INTEGER PRIMARY KEY,
       trip_id INTEGER,
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
       pickup_booking_rule_id INTEGER,
       drop_off_booking_rule_id INTEGER,
       start_pickup_dropoff_window TEXT,
       end_pickup_dropoff_window TEXT,
       mean_duration_factor TEXT,
       mean_duration_offset TEXT,
       safe_duration_factor TEXT,
       safe_duration_offset TEXT
       );

-- INSERT INTO users (username) VALUES ('willkurt');

-- INSERT INTO tools (name,description,lastReturned,timesBorrowed)
-- VALUES ('hammer','hits stuff','2017-01-01',0);

-- INSERT INTO tools (name,description,lastReturned,timesBorrowed)
-- VALUES ('saw','cuts stuff','2017-01-01',0);

-- INSERT INTO users (username) VALUES ('willkurt');

-- INSERT INTO tools (name,description,lastReturned,timesBorrowed)
-- VALUES ('hammer','hits stuff','2017-01-01',0);

-- INSERT INTO tools (name,description,lastReturned,timesBorrowed)
-- VALUES ('saw','cuts stuff','2017-01-01',0);