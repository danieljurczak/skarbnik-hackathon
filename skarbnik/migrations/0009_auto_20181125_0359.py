# Generated by Django 2.1.3 on 2018-11-25 03:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('skarbnik', '0008_auto_20181125_0358'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='creation_date',
            field=models.DateField(),
        ),
    ]