from django.urls import path

from . import merge_prog

urlpatterns = [
    path('', merge_prog.index, name='index'),
    path('api/v1/merge',merge_prog.merge_file,name='merge')
]
