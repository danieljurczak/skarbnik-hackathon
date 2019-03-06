# Generated by Django 2.0.2 on 2019-03-06 17:18

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('skarbnik', '0003_payment_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='payment',
            name='currency',
            field=models.CharField(default='PLN', max_length=10),
        ),
        migrations.AddField(
            model_name='paymentdetail',
            name='created',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
