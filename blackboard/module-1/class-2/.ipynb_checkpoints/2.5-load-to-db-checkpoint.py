from sqlalchemy import create_engine, MetaData
import json
import sys
from datetime import datetime
from collections import defaultdict
from pathlib import Path
import os

def connect_to_db():
    return create_engine('postgresql://postgres@localhost:5432/postgres')

def load_db_schema(engine):
    
    metadata = MetaData()
    metadata.reflect(engine, schema='waze')
    return metadata

def to_default_dict(list_of_dic):
    return [defaultdict(lambda: None, dic) for dic in list_of_dic]

def load_and_prepare_waze(path):
    
    data = json.load(open(path, 'r'))
    
    
    tables = {}
    tables['jams'], tables['alerts'], tables['irregularities'] = \
        list(map(to_default_dict,[data['jams'], 
                              data['alerts'],
                              data['irregularities']]))
        
    return tables, data

def make_jam_dict(jam, data):
    return dict(uuid=jam['uuid'],
                pub_millis=jam['pubMillis'],
                pub_utc_date=datetime.strptime(data['startTime'], 
                                               '%Y-%m-%d %H:%M:%S:%f'),
                start_node=jam['startNode'],
                end_node=jam['endNode'],
                road_type=jam['roadType'],
                street=jam['street'],
                city=jam['city'],
                country=jam['country'],
                delay=jam['delay'],
                speed=jam['speed'],
                speed_kmh=jam['speedKMH'],
                length=jam['length'],
                turn_type=jam['turnType'],
                level=jam['level'],
                blocking_alert_id=jam['blockingAlertId'],
                line=jam['line'],
                type=jam['type'],
                turn_line=jam['turnType'])

def make_alert_dict(alert, data):
    return dict(            
            uuid=                         alert['uuid'],
            pub_millis=                   alert['pubMillis'],
            pub_utc_date=                 datetime.strptime(data['startTime'], 
                                               '%Y-%m-%d %H:%M:%S:%f'),
            road_type=                    alert['roadType'],
            location_x=                   alert['location']['x'],
            location_y=                   alert['location']['y'],
            street=                       alert['street'],
            city=                         alert['city'],
            country=                      alert['country'],
            magvar=                       alert['magvar'],
            reliability=                  alert['reliability'],
            report_description=           alert['reportDescription'],
            report_rating=                alert['reportRating'],
            confidence=                   alert['confidence'],
            type=                         alert['type'],
            subtype=                      alert['subtype'],
            report_by_municipality_user=  alert['reportByMunicipalityUser'],
            thumbs_up=                    alert['nThumbsUp'],
            jam_uuid=                     alert['jamUuid'])

def make_irregularity_dict(irregularity, data):
    return dict(
            uuid=                           irregularity['id'], 
            detection_date_millis=          irregularity['detectionDateMillis'], 
            detection_date=                 irregularity['detectionDate'],
            detection_utc_date=             datetime.strptime(irregularity['detectionDate'],
                                                                       '%a %b %d %H:%M:%S %z %Y'),
            update_date_millis=             irregularity['updateDateMillis'],
            update_date=                    irregularity['updateDate'],
            update_utc_date=                datetime.strptime(irregularity['updateDate'],
                                                                       '%a %b %d %H:%M:%S %z %Y'), 
            street=                         irregularity['street'],
            city=                           irregularity['city'],
            country=                        irregularity['country'],
            is_highway=                     irregularity['isHighway'],
            speed=                          irregularity['speed'],
            regular_speed=                  irregularity['regularSpeed'],
            delay_seconds=                  irregularity['delaySeconds'],
            seconds=                        irregularity['seconds'],
            length=                         irregularity['length'],
            trend=                          irregularity['trend'],
            type=                           irregularity['type'],
            severity=                       irregularity['severity'],
            jam_level=                      irregularity['jamLevel'],
            drivers_count=                  irregularity['driversCount'],
            alerts_count=                   irregularity['alertsCount'],
            n_thumbs_up=                    irregularity['nThumbsUp'],
            n_comments=                     irregularity['nComments'],
            n_images=                       irregularity['nImages'],
            line=                           irregularity['line'],
            cause_type=                     irregularity['causeType'],
            start_node=                     irregularity['startNode'],
            end_node=                       irregularity['endNode'],
    )

def load_data_to_db(tables, data, engine, meta):
    
    with engine.connect() as conn:
        for jam in tables['jams']:
            conn.execute(meta.tables['waze.jams'].insert(), 
                     make_jam_dict(jam, data))
        for alert in tables['alerts']:
            conn.execute(meta.tables['waze.alerts'].insert(), 
                     make_alert_dict(alert, data))
        for irregularity in tables['irregularities']:
            conn.execute(meta.tables['waze.irregularities'].insert(), 
                     make_irregularity_dict(irregularity, data))
        
def move_data(file, original_path, destination_path):
    
    os.rename(file, original_path.parent / destination_path / file.name)
    

def main():
    
    engine = connect_to_db()
    meta = load_db_schema(engine)
    
    # get all files from raw
    p = Path(sys.argv[0]).parent / 'data' / 'raw'
    for file in p.glob('*.json'):
        tables, data = load_and_prepare_waze(file)
        load_data_to_db(tables, data, engine, meta)
        move_data(file, p, 'processed')
    
        
if __name__ == '__main__':
    
    main()
        
    