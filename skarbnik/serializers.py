from rest_framework import serializers
from . import models
from django.contrib.auth.hashers import make_password

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
class ClassSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField(many=True)

    class Meta:
        model = models.Class
        fields = ('id_field', 'name', 'user')

class PaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Payment
        fields = ('id_field', 'class_field', 'creation_date', 'start_date', 'end_date', 'amount', 'name', 'description')

class PaymentDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.PaymentDetail
        fields = ('id_field', 'payment', 'student', 'amount_paid')

class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Student
        fields = ('id_field', 'class_field', 'user', 'name')

class ChangePasswordSerializer(serializers.Serializer):
    """
    Serializer for password change endpoint.
    """
    old_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True)

