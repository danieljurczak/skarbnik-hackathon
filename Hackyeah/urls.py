"""Hackyeah URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path , include
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token
from rest_framework import routers
from skarbnik import views as myapp_views
from django.conf.urls import url
from rest_framework_swagger.views import get_swagger_view
from django.contrib import admin
from django.contrib.auth import views as auth_views

schema_view = get_swagger_view(title='Skarbnik API')

router = routers.DefaultRouter()
router.register(r'class', myapp_views.ClassViewset)
router.register(r'payment', myapp_views.PaymentViewset)
router.register(r'paymentdetail', myapp_views.PaymentDetailViewset)
router.register(r'student', myapp_views.StudentViewset)
router.register(r'users', myapp_views.UserViewset)
router.register(r'teachers', myapp_views.TeachersViewset, basename='users')
router.register(r'activity', myapp_views.UserLoginActivityViewset, basename='activity')

urlpatterns = [
    path('api/users/change_password', myapp_views.UpdatePassword.as_view()),
    path('api/users/login', view=myapp_views.ObtainJWTView.as_view(), name='login'),
    path('admin/', admin.site.urls),
    path('accounts/login/',  auth_views.login, {'template_name': 'registration/login.html'}, name='login'),
    path('accounts/logout/', auth_views.logout, name='logout'),
    path('api/users/refresh', refresh_jwt_token),
    path('api/', include(router.urls)),
    path('', schema_view)

]

