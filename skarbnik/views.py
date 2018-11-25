
from rest_framework import viewsets, generics, views, status
from . import models
from . import serializers
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend

class ClassViewset(viewsets.ModelViewSet):
    queryset = models.Class.objects.all()
    serializer_class = serializers.ClassSerializer

class PaymentViewset(viewsets.ModelViewSet):
    queryset = models.Payment.objects.all()
    serializer_class = serializers.PaymentSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_fields = ('class_field', )
class PaymentDetailViewset(viewsets.ModelViewSet):
    queryset = models.PaymentDetail.objects.all()
    serializer_class = serializers.PaymentDetailSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_fields = ('student', )

class StudentViewset(viewsets.ModelViewSet):
    queryset = models.Student.objects.all()
    serializer_class = serializers.StudentSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_fields = ('user',)

class UserViewset(viewsets.ModelViewSet):
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
    A simple ViewSet for listing or retrieving users.
    """
    def list(self, request):
        queryset = models.User.objects.raw('SELECT * FROM user WHERE user.role = 1 AND user.id_ NOT IN (SELECT user_id FROM class)')
        serializer = serializers.TeacherSerializer(queryset, many=True, context={'request': request})
        return Response(serializer.data)

class ProgressViewset(viewsets.ViewSet):
    """
    A simple ViewSet for listing or retrieving users.
    """
    def list(self, request):
        pk = "1"
        obiekty = models.Student.objects.raw('SELECT student.id_, payment.amount * COUNT(student.id|_) AS "target", SUM(payment_detail.amount_paid) AS paid FROM payment INNER JOIN student ON payment.class_id = student.class_id INNER JOIN payment_detail ON payment_detail.payment_id_ = payment.id_ AND payment_detail.student_id_ = student.id_ WHERE payment.id_ =' + pk)
        result = []
        for n in obiekty:
            for x in n:
                print(x)


        # serializer = serializers.ProgressSerializer(queryset, many=True, context={'request': request})
        # return Response(serializer.data)
