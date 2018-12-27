
from rest_framework import viewsets, generics, views, status
from . import models
from . import serializers
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework_jwt.views import ObtainJSONWebToken
from django.shortcuts import get_object_or_404, redirect


class ClassViewset(viewsets.ModelViewSet):
    """
    Viewset for class details, lists etc.
    """
    queryset = models.Class.objects.all()
    serializer_class = serializers.ClassSerializer
    def get_queryset(self):
        queryset = models.Class.objects.all()
        user_id = self.request.query_params.get('user', None)
        if user_id is not None:
            queryset = queryset.filter(user__id_field=user_id)
        return queryset

    def list(self, request):
        queryset = self.get_queryset()
        serializer = serializers.ClassListSerializer(queryset, many=True, context={'request': request})
        return Response(serializer.data)

class PaymentViewset(viewsets.ModelViewSet):
    """
    Viewset for Payments(list, detail, create, retrieve, delete)
    """
    queryset = models.Payment.objects.all()
    serializer_class = serializers.PaymentSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_fields = ('class_field', )


class PaymentDetailViewset(viewsets.ModelViewSet):
    """
    Viewset for Payments Details(list, detail, create, retrieve, delete). Record for user's payments.
    """
    queryset = models.PaymentDetail.objects.all()
    serializer_class = serializers.PaymentDetailSerializer
    def get_queryset(self):
        queryset = models.PaymentDetail.objects.all()
        student_id = self.request.query_params.get('student', None)
        payment_id = self.request.query_params.get('payment', None)
        if student_id is not None:
            queryset = queryset.filter(student__id_field=student_id)
        if payment_id is not None:
            queryset =  queryset.filter(payment__id_field=payment_id)
        
        return queryset

    def list(self, request):
        queryset = self.get_queryset()
        serializer = serializers.PaymentListSerializer(queryset, many=True, context={'request': request})
        return Response(serializer.data)
    
class StudentViewset(viewsets.ModelViewSet):
    """
    Viewset for Student(list, detail, create, retrieve, delete)
    """
    
    serializer_class = serializers.StudentSerializer
    queryset = models.Student.objects.all()
    def get_queryset(self):
        queryset = models.Student.objects.all()
        user_id = self.request.query_params.get('user', None)
        if user_id is not None:
            queryset = queryset.filter(user__id_field=user_id)
        return queryset

    def list(self, request):
        queryset = self.get_queryset()
        serializer = serializers.StudentListSerializer(queryset, many=True, context={'request': request})
        return Response(serializer.data)

class CounterViewSet(viewsets.ModelViewSet):
    queryset = models.Class.objects.all()
    serializer_class = serializers.CounterSerializer

class UserViewset(viewsets.ModelViewSet):
    """
    Viewset for User(list, detail, create, retrieve, delete).
    If you are authorised, you can request /api/user/current and get details about yourself.
    """
    queryset = models.User.objects.all()
    serializer_class = serializers.UserSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_fields = ('role',)

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

class TeachersViewset(viewsets.ViewSet):
    """
    An endpoint for listing teachers without class.
    """
    def list(self, request):
        queryset = models.User.objects.raw('SELECT * FROM user WHERE user.role = 1 AND user.id_ NOT IN (SELECT user_id FROM class)')
        serializer = serializers.TeacherSerializer(queryset, many=True, context={'request': request})
        return Response(serializer.data)

# Create your views here.
class ObtainJWTView(ObtainJSONWebToken):
    serializer_class = serializers.JWTSerializer

class UserLoginActivityViewset(viewsets.ViewSet):
    """
    An endpoint for listing Login Activities without class.
    """
    def get_queryset(self):
        queryset = models.UserLoginActivity.objects.all()
        name = self.request.query_params.get('login_username')

        if name:
            queryset = queryset.filter(login_username=name)

        return queryset
    def list(self, request):
        queryset = self.get_queryset()
        serializer = serializers.UserLoginActivitySerializer(queryset, many=True, context={'request': request})
        
        return Response(serializer.data)
    def retrieve(self, request, pk=None):
        queryset = models.UserLoginActivity.objects.all()
        user_activity = get_object_or_404(queryset, pk=pk)
        serializer = serializers.UserLoginActivitySerializer(user_activity)
        return Response(serializer.data)


