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

router = routers.DefaultRouter()
router.register(r'class', myapp_views.ClassViewset)
router.register(r'payment', myapp_views.PaymentViewset)
router.register(r'paymentdetail', myapp_views.PaymentDetailViewset)
router.register(r'student', myapp_views.StudentViewset)
router.register(r'users', myapp_views.UserViewset)
<<<<<<< HEAD
router.register(r'teachers', myapp_views.TeachersViewset, basename='users')
router.register(r'progress', myapp_views.ProgressViewset, basename='student')
=======

>>>>>>> parent of e705b6c... Add teachers endpoint

urlpatterns = [
    path('api/users/change_password', myapp_views.UpdatePassword.as_view()),
    path('api/users/login', obtain_jwt_token),
    path('api/users/refresh', refresh_jwt_token),
    path('api/', include(router.urls)),

]
