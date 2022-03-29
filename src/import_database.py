import sqlalchemy
import pandas as pd
import os
from src.config import FILEPATH
from dotenv import load_dotenv
from src.queries import queries_list

#open connection

load_dotenv()

USER = os.getenv('USER')
PASSWD = os.getenv('PASSWD')
HOST = os.getenv('HOST')
DB_NAME = os.getenv('DB_NAME')
    
    
def db():
    conn = sqlalchemy.create_engine(f'mysql+pymysql://{USER}:{PASSWD}@{HOST}/{DB_NAME}')
    print('Conexão criada com o MySQL')
    meta = sqlalchemy.MetaData(bind=conn)
    meta.reflect()
    meta.drop_all()
    return conn
    
    
#read file
def read_file(file, conn):
    table_name = file.split('\\')[-1].replace('.csv', '')
    #insert values
    df = pd.read_csv(file)
    df.to_sql(table_name, conn, index = False)
    print(f'{table_name} inserida no banco de dados')

#use sql queries
def queries(script, conn):            
    con = conn.raw_connection()
    cursor = con.cursor()
    cursor.execute(script)
    con.commit()
            

def main():
    conn = db()
    file = FILEPATH
    read_file(file,conn)
    print('Realizando consulta com queries')
    for query in queries_list:
        queries(query, conn)  
    print('Processo terminado com sucesso')
    
    
if __name__ == '__main__':
    main()