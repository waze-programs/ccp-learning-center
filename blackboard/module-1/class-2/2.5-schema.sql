CREATE SCHEMA waze;

-- roads table
CREATE TABLE waze.roads 
(
  "id"                              SERIAL PRIMARY KEY,
  "value"                           INT NOT NULL,
  "name"                            VARCHAR(100) NOT NULL
);

-- load roads
INSERT INTO waze.roads (value, name) VALUES (1, 'Streets');
INSERT INTO waze.roads (value, name) VALUES (2, 'Primary Street');
INSERT INTO waze.roads (value, name) VALUES (3, 'Freeways');
INSERT INTO waze.roads (value, name) VALUES (4, 'Ramps');
INSERT INTO waze.roads (value, name) VALUES (5, 'Trails');
INSERT INTO waze.roads (value, name) VALUES (6, 'Primary');
INSERT INTO waze.roads (value, name) VALUES (7, 'Secondary');
INSERT INTO waze.roads (value, name) VALUES (8, '4X4 Trails');
INSERT INTO waze.roads (value, name) VALUES (9, 'Walkway');
INSERT INTO waze.roads (value, name) VALUES (10, 'Pedestrian');
INSERT INTO waze.roads (value, name) VALUES (11, 'Exit');
INSERT INTO waze.roads (value, name) VALUES (12, '?');
INSERT INTO waze.roads (value, name) VALUES (13, '?');
INSERT INTO waze.roads (value, name) VALUES (14, '4X4 Trails');
INSERT INTO waze.roads (value, name) VALUES (15, 'Ferry crossing');
INSERT INTO waze.roads (value, name) VALUES (16, 'Stairway');
INSERT INTO waze.roads (value, name) VALUES (17, 'Private road');
INSERT INTO waze.roads (value, name) VALUES (18, 'Railroads');
INSERT INTO waze.roads (value, name) VALUES (19, 'Runway/Taxiway');
INSERT INTO waze.roads (value, name) VALUES (20, 'Parking lot road');
INSERT INTO waze.roads (value, name) VALUES (21, 'Service road');

-- alert type table
CREATE TABLE waze.alert_types 
(
  "id"                              SERIAL PRIMARY KEY NOT NULL,
  "type"                            VARCHAR(100) NOT NULL,
  "subtype"                         VARCHAR(150)
);

-- load alert_types
INSERT INTO waze.alert_types (type, subtype) VALUES ('ACCIDENT', 'ACCIDENT_MINOR');
INSERT INTO waze.alert_types (type, subtype) VALUES ('ACCIDENT', 'ACCIDENT_MAJOR');
INSERT INTO waze.alert_types (type, subtype) VALUES ('ACCIDENT', 'NO_SUBTYPE');
INSERT INTO waze.alert_types (type, subtype) VALUES ('JAM', 'JAM_MODERATE_TRAFFIC');
INSERT INTO waze.alert_types (type, subtype) VALUES ('JAM', 'JAM_HEAVY_TRAFFIC');
INSERT INTO waze.alert_types (type, subtype) VALUES ('JAM', 'JAM_STAND_STILL_TRAFFIC');
INSERT INTO waze.alert_types (type, subtype) VALUES ('JAM', 'JAM_LIGHT_TRAFFIC');
INSERT INTO waze.alert_types (type, subtype) VALUES ('JAM', 'NO_SUBTYPE');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_ROAD');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_SHOULDER');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_WEATHER');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_ROAD_OBJECT');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_ROAD_POT_HOLE');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_ROAD_ROAD_KILL');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_SHOULDER_CAR_STOPPED');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_SHOULDER_ANIMALS');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_SHOULDER_MISSING_SIGN');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_WEATHER_FOG');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_WEATHER_HAIL');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_WEATHER_HEAVY_RAIN');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_WEATHER_HEAVY_SNOW');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_WEATHER_FLOOD');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_WEATHER_MONSOON');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_WEATHER_TORNADO');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_WEATHER_HEAT_WAVE');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_WEATHER_HURRICANE');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_WEATHER_FREEZING_RAIN');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_ROAD_LANE_CLOSED');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_ROAD_OIL');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_ROAD_ICE');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_ROAD_CONSTRUCTION');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_ROAD_CAR_STOPPED');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'HAZARD_ON_ROAD_TRAFFIC_LIGHT_FAULT');
INSERT INTO waze.alert_types (type, subtype) VALUES ('WEATHERHAZARD/HAZARD', 'NO_SUBTYPE');
INSERT INTO waze.alert_types (type, subtype) VALUES ('MISC', 'NO_SUBTYPE');
INSERT INTO waze.alert_types (type, subtype) VALUES ('CONSTRUCTION', 'NO_SUBTYPE');
INSERT INTO waze.alert_types (type, subtype) VALUES ('ROAD_CLOSED', 'ROAD_CLOSED_HAZARD');
INSERT INTO waze.alert_types (type, subtype) VALUES ('ROAD_CLOSED', 'ROAD_CLOSED_CONSTRUCTION');
INSERT INTO waze.alert_types (type, subtype) VALUES ('ROAD_CLOSED', 'ROAD_CLOSED_EVENT');

-- jams table
CREATE TABLE waze.jams 
(
  "id"                              SERIAL PRIMARY KEY NOT NULL,
  "uuid"                            TEXT NOT NULL,
  "pub_millis"                      INT8 NOT NULL,
  "pub_utc_date"                    TIMESTAMP,
  "start_node"                      TEXT,
  "end_node"                        TEXT,
  "road_type"                       INT2,
  "street"                          TEXT,
  "city"                            TEXT,
  "country"                         TEXT,
  "delay"                           INT2,
  "speed"                           float4,
  "speed_kmh"                       float4,
  "length"                          INT2,
  "turn_type"                       TEXT,
  "level"                           INT2,
  "blocking_alert_id"               TEXT,
  "line"                            TEXT,
  "type"                            TEXT,
  "ns_direction"                    TEXT, -- N or S, eg. north or south, direction jam start to jam line heads
  "ew_direction"                    TEXT, -- E or W, eg. east or west
  "dayofweek"                       INT4, -- 1-7, eg Monday - Sunday
  "turn_line"                       TEXT
);

-- alerts table
CREATE TABLE waze.alerts
(
  "id"                              SERIAL PRIMARY KEY NOT NULL,
  "uuid"                            TEXT NOT NULL, 
  "pub_millis"                      INT8 NOT NULL,
  "pub_utc_date"                    TIMESTAMP,
  "road_type"                       INT2,
  "location_x"                      FLOAT8,
  "location_y"                      FLOAT8,
  "street"                          TEXT,
  "city"                            TEXT,
  "country"                         TEXT,
  "magvar"                          INT2,
  "reliability"                     INT2,
  "report_description"              TEXT,
  "report_rating"                   INT2,
  "confidence"                      INT2,
  "type"                            TEXT,
  "subtype"                         TEXT,
  "report_by_municipality_user"     BOOLEAN,
  "thumbs_up"                       INT4,
  "jam_uuid"                        TEXT
);

-- irregularities table
CREATE TABLE waze.irregularities
(
  "id"                              SERIAL PRIMARY KEY NOT NULL,
  "uuid"                            TEXT NOT NULL,
  "detection_date_millis"           INT8 NOT NULL,
  "detection_date"                  TEXT,
  "detection_utc_date"              TIMESTAMP,
  "update_date_millis"              INT8 NOT NULL,
  "update_date"                     TEXT,
  "update_utc_date"                 TIMESTAMP,
  "street"                          TEXT,
  "city"                            TEXT,
  "country"                         TEXT,
  "is_highway"                      BOOLEAN,
  "speed"                           float4,
  "regular_speed"                   float4,
  "delay_seconds"                   INT2,
  "seconds"                         INT2,
  "length"                          INT2,
  "trend"                           INT4,
  "type"                            TEXT,
  "severity"                        float4,
  "jam_level"                       INT2,
  "drivers_count"                   INT2,
  "alerts_count"                    INT2,
  "n_thumbs_up"                     INT4,
  "n_comments"                      INT4,
  "n_images"                        INT2,
  "line"                            TEXT,
  "cause_type"                      TEXT,
  "start_node"                      TEXT,
  "end_node"                        TEXT
);
