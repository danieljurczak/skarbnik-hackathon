from rest_framework import viewsets, generics, views, status
from . import models
from . import serializers
from rest_framework.response import Response
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
    def get_object(self):
        pk = self.kwargs.get('pk')

        if pk == "current":
            return self.request.user

        return super(UserViewset, self).get_object()

class UpdatePassword(views.APIView):
    """
    An endpoint for changing password.
    """

    def get_object(self, queryset=None):
        return self.request.user

    def put(self, request, *args, **kwargs):
        self.object = self.get_object()
        serializer = serializers.ChangePasswordSerializer(data=request.data)

        if serializer.is_valid():
            # Check old password
            old_password = serializer.data.get("old_password")
            if not self.object.check_password(old_password):
                return Response({"old_password": ["Wrong password."]}, 
                                status=status.HTTP_400_BAD_REQUEST)
            # set_password also hashes the password that the user will get
            self.object.set_password(serializer.data.get("new_password"))
            self.object.save()
            return Response(status=status.HTTP_204_NO_CONTENT)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class TeachersViewset(viewsets.ReadOnlyModelViewSet):
    queryset = models.User.objects.filter(role=1)
    serializer_class = serializers.TeachersSerializer
