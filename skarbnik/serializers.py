from rest_framework import serializers
from . import models
from django.contrib.auth.hashers import make_password
from rest_framework_jwt.serializers import JSONWebTokenSerializer, jwt_payload_handler, jwt_encode_handler
from django.contrib.auth import authenticate, user_logged_in


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.User
        fields = ('url', 'id_field', 'name', 'username', 'email', 'role', 'password')
    
    def create(self, validated_data):
        user = models.User.objects.create_user(
            email=validated_data['email'],
            username=validated_data['username'],
            password = make_password(validated_data['password']),
            role = validated_data['role'],
            name = validated_data['name'],
        )
        user.set_password(validated_data['password'])
        user.save()
        return user
class UserMinInfoSerializer(serializers.ModelSerializer):
   class Meta:
       model = models.User
       fields = ('id_field', 'name')
       
class TeacherSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = models.User
        fields = ('url', 'id_field', 'name', 'username', 'email', 'role', 'password')

class UserLoginActivitySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.UserLoginActivity
        fields = ('id', 'login_datetime', 'login_username', 'status', 'login_IP')

class ClassSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Class
        fields = ('id_field', 'name', 'user')

class ClassListSerializer(serializers.ModelSerializer):
    user = UserMinInfoSerializer()
    class Meta:
        model = models.Class
        fields = ('id_field', 'name', 'user')
class ClassMinInfoSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Class
        fields = ('id_field', 'name')


class PaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Payment
        fields = ('id_field', 'class_field', 'creation_date', 'start_date', 'end_date', 'amount', 'name', 'description')


class StudentSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Student
        fields = ('id_field', 'class_field', 'user', 'name')
class StudentListSerializer(serializers.ModelSerializer):
    user = UserMinInfoSerializer()
    class_field = ClassMinInfoSerializer()
    class Meta:
        model = models.Student
        fields = ('id_field', 'class_field', 'user', 'name')

class PaymentDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.PaymentDetail
        fields = ('id_field', 'payment', 'student', 'amount_paid')

class CounterSerializer(serializers.ModelSerializer):
    student_count = serializers.SerializerMethodField(method_name="students_count_method")
    teachers_count = serializers.SerializerMethodField(method_name="teachers_count_method")
    parent_count = serializers.SerializerMethodField(method_name="parents_count_method")
    class_count = serializers.SerializerMethodField(method_name="classes_count_method")

    class Meta:
        model = models.Class
        fields = ('student_count', 'teachers_count', 'parent_count', 'class_count',)

    def students_count_method(self, obj):
        return models.Student.objects.count()
    def teachers_count_method(self, obj):
        return models.User.objects.filter(role=1).count()
    def parents_count_method(self, obj):
        return models.User.objects.filter(role=0).count()
    def classes_count_method(self, obj):
        return models.Class.objects.count()


class PaymentListSerializer(serializers.ModelSerializer):
    student = serializers.SlugRelatedField(
        many=False,
        read_only=True,
        slug_field='name'
     )
    class Meta:
        model = models.PaymentDetail
        fields = ('id_field', 'payment', 'student', 'amount_paid')

class ChangePasswordSerializer(serializers.Serializer):
    """
    Serializer for password change endpoint.
    """
    old_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True)


class JWTSerializer(JSONWebTokenSerializer):
    def validate(self, attrs):
        credentials = {
            self.username_field: attrs.get(self.username_field),
            'password': attrs.get('password')
        }

        if all(credentials.values()):
            user = authenticate(request=self.context['request'], **credentials)

            if user:
                if not user.is_active:
                    msg = 'User account is disabled.'
                    raise serializers.ValidationError(msg)

                payload = jwt_payload_handler(user)
                user_logged_in.send(sender=user.__class__, request=self.context['request'], user=user)

                return {
                    'token': jwt_encode_handler(payload),
                    'user': user
                }
            else:
                msg = 'Unable to log in with provided credentials.'
                raise serializers.ValidationError(msg)
        else:
            msg = 'Must include "{username_field}" and "password".'
            msg = msg.format(username_field=self.username_field)
            raise serializers.ValidationError(msg)

