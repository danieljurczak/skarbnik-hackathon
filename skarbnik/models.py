# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.contrib.auth.models import AbstractUser


class Class(models.Model):
    id_field = models.AutoField(db_column='id_', primary_key=True)  # Field renamed because it ended with '_'.
    user = models.ForeignKey('User', on_delete=models.CASCADE, unique=True)
    name = models.CharField(max_length=100)

    class Meta:
        managed = True
        db_table = 'class'


class Payment(models.Model):
    id_field = models.AutoField(db_column='id_', primary_key=True)  # Field renamed because it ended with '_'.
    class_field = models.ForeignKey(Class, on_delete=models.CASCADE, db_column='class_id')  # Field renamed because it was a Python reserved word.
    creation_date = models.DateField()
    start_date = models.DateField()
    end_date = models.DateField()
    amount = models.DecimalField(max_digits=6, decimal_places=2)
    name = models.CharField(max_length=255)
    description = models.TextField()

    class Meta:
        managed = True
        db_table = 'payment'


class PaymentDetail(models.Model):
    id_field = models.AutoField(db_column='id_', primary_key=True)  # Field renamed because it ended with '_'.
    payment = models.ForeignKey(Payment, on_delete=models.CASCADE, blank=True, null=True)
    student = models.ForeignKey('Student', on_delete=models.CASCADE, unique=True)
    amount_paid = models.DecimalField(max_digits=6, decimal_places=2)

    class Meta:
        managed = True
        db_table = 'payment_detail'


class Student(models.Model):
    id_field = models.AutoField(db_column='id_', primary_key=True)  # Field renamed because it ended with '_'.
    class_field = models.ForeignKey(Class, on_delete=models.CASCADE, db_column='class_id', blank=True, null=True)  # Field renamed because it was a Python reserved word.
    user = models.ForeignKey('User', on_delete=models.CASCADE,)
    name = models.CharField(max_length=255)

    class Meta:
        managed = True
        db_table = 'student'


class User(AbstractUser):
    
    id_field = models.AutoField(db_column='id_', primary_key=True)  # Field renamed because it ended with '_'.
    name = models.CharField(max_length=100)
    username = models.CharField(max_length=64, unique=True)
    email = models.CharField(max_length=120)
    password = models.CharField(max_length=200)
    role = models.IntegerField()
    USERNAME_FIELD = 'username'
    
    class Meta:
        managed = True
        db_table = 'user'
