# Generated by Django 4.1.7 on 2023-03-27 17:16

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('repair', '0003_alter_employeecomment_options_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='repairorder',
            name='employee',
            field=models.ManyToManyField(through='repair.EmployeeComment', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='repair',
            name='estimated_duration',
            field=models.PositiveIntegerField(default=3),
        ),
    ]