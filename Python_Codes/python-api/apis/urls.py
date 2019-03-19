from django.urls import path

from . import merge_prog
from . import fetch_db

urlpatterns = [
    path('', merge_prog.index, name='index'),
    path('api/v1/merge',merge_prog.merge_file,name='merge'),
    path('api/v1/fetch_redis',fetch_db.fetch_from_redis,name='fetchredis')
]
