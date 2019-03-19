import mysql.connector
import configparser
import redis


def get_from_redis(key):
    """
    """
    return 0

def get_from_mysql():
    """
    """
    return 0

def refresh_redis():
    """
    """
    return 0

if __name__ == '__main__':
    config = configparser.ConfigParser()
    config.read('../db.ini')
    
    if 'MySQL' and 'REDIS' not in config:
        print('Wrong config!!!')
        exit()    
    
    mysql_hostname = config['MySQL']['host']
    mysql_port = config['MySQL']['port']
    mysql_user = config['MySQL']['username']
    mysql_password = config['MySQL']['password']
    mysql_db = config['MySQL']['db']
    
    redis_hostname = config['REDIS']['host']
    redis_port = config['REDIS']['port']
    redis_user = config['REDIS']['username']
    redis_password = config['REDIS']['password']
    redis_db = config['REDIS']['db']
    
    mysqldb = mysql.connector.connect(
      host = mysql_hostname,
      user = mysql_user,
      passwd = mysql_password,
      database = mysql_db
    )
    
    r = redis.Redis(host=redis_hostname, 
                    port=redis_port, db=0)
    
    mysql_cursor = mysqldb.cursor()
    
    table_name = 'employees'
    
    mysql_cursor.execute("SELECT count(*) from employees")
    key = table_name[0:4] + '_count'
    value = str(mysql_cursor.fetchone()[0])
    r.set(key,value)
    
    mysql_cursor.execute("SELECT * FROM employees")
    value = ""
    for col_name in mysql_cursor.column_names:
        value = value + col_name + ","
    
    key = table_name[0:4] + '_col_desc'
    r.set(key,value)
    
    print("key=" + key)
    print("value=" + value)
    
    while True:
        table_row = mysql_cursor.fetchone()
        if table_row == None:
            break
        key = table_name[0:4] + '_rec_' + str(table_row[0])
        value = ""
        for col in table_row:
            value = value + str(col) + ','
        r.set(key,value)
