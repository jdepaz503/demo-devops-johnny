from django.contrib import admin
from django.http import JsonResponse
from django.urls import path, include


def raiz(request):
    return JsonResponse({
        'service': 'demo-devops-johnny',
        'health': '/health/',
        'users': '/api/users/',
    })


def health(request):
    return JsonResponse({'status': 'ok'})


urlpatterns = [
    path('', raiz),
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),
    path('health/', health),
]
