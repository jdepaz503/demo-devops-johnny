from rest_framework import routers

from .views import UserViewSet

router = routers.DefaultRouter()
router.register('users', UserViewSet, 'users')

urlpatterns = router.urls
