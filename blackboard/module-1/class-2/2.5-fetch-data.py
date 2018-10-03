
import requests
import json
from datetime import datetime
from pathlib import Path
import sys

def get_data(url):
    
    headers = {'user-agent': "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0",}

    response = requests.get(url, headers=headers)

    return json.loads(response.text)

def get_date_string():
    return datetime.strftime(datetime.now(), '%Y-%m-%d_%H:%M:%S')

def get_file_name(city):
    return '{city}_{date}.json'.format(city=city, date=get_date_string())

if __name__ == '__main__':
    city = 'Lima'
    url = 'https://world-georss.waze.com/rtserver/web/TGeoRSS?acotu=true&format=JSON&irmie=true&types=traffic%2Calerts%2Cirregularities&tk=ccp_partner&ccp_partner_name=Fundacao+Getulio+Vargas&polygon=-77.217,-11.854;-77.286,-12.047;-77.077,-12.312;-76.907,-12.32;-76.742,-12.232;-76.84,-11.871;-77.116,-11.811;-77.217,-11.854'
    
    # fetch data
    data = get_data(url)
    
    # save data
    path = Path(sys.argv[0]).resolve().parent.parent / 'data' / 'raw'
    json.dump(data, open(path / get_file_name(city), 'w'))
    
    print('Data Captured!')
    
    