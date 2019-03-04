from django.http import HttpResponse


def index(request):
    return HttpResponse("Hello, world!!!.")

def merge_file(request):
    print(request.body.decode("utf-8"))
    return HttpResponse("merge program")
    