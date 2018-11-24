from rest_framework import viewsets
from . import models
from . import serializers

class ClassViewset(viewsets.ModelViewSet):
    queryset = models.Class.objects.all()
    serializer_class = serializers.ClassSerializer

class PaymentViewset(viewsets.ModelViewSet):
    queryset = models.Payment.objects.all()
    serializer_class = serializers.PaymentSerializer

class PaymentDetailViewset(viewsets.ModelViewSet):
    queryset = models.PaymentDetail.objects.all()
    serializer_class = serializers.PaymentDetailSerializer

class StudentViewset(viewsets.ModelViewSet):
    queryset = models.Student.objects.all()
    serializer_class = serializers.StudentSerializer
    
class UserViewset(viewsets.ModelViewSet):
    queryset = models.User.objects.all()
    serializer_class = serializers.UserSerializer
