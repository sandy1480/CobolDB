from django.http import HttpResponse
import redis,configparser

def index(request):
    return HttpResponse("Hello, world!!!.")

def fetch_from_redis(request):
    config = configparser.ConfigParser()
    config.read('../../db.ini')
    
    if 'REDIS' not in config:
        print('Wrong config!!!')
        exit()    
    
    redis_hostname = config['REDIS']['host']
    redis_port = config['REDIS']['port']
    redis_user = config['REDIS']['username']
    redis_password = config['REDIS']['password']
    redis_db = config['REDIS']['db']
    r = redis.Redis(host=redis_hostname, 
                    port=redis_port, db=0)
    table_desc = r.get("empl_col_desc")
    print(request.body.decode("utf-8"))
    return HttpResponse("merge program  " + table_desc.decode("utf-8"))
    