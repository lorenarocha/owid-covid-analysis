import os

OUTPUT_DIR = os.path.dirname(os.path.realpath('main.py')) + '/data'
URL = 'https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv'
FILE = 'owid-covid-data.csv'
FILEPATH = os.path.join(OUTPUT_DIR, FILE)
SIZE = os.path.getsize(FILEPATH)