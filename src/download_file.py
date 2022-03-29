import requests
import time
from src.config import URL, FILEPATH, SIZE

def download_file(url, filename):
    response = requests.get(url)
    if response.status_code == requests.codes.OK:
        with open(filename, 'wb') as new_file:
            new_file.write(response.content)
        print('Arquivo escrito com sucesso!')       
    else:
        response.raise_for_status()
    
    
def main():
    tinit = time.time()
    download_file(URL,FILEPATH)
    tend = time.time()
    print ('Download feito em {0}s com tamanho de {1} mb'.format(round(tend-tinit, 2), 
                                                                 round(SIZE/(1024 ** 2), 2)))
            
        
if __name__ == '__main__':
    main()