# Generated by Django 4.1.7 on 2023-03-28 13:26

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('repair', '0009_repairorder_added_by'),
    ]

    operations = [
        migrations.AlterField(
            model_name='repairorder',
            name='added_by',
            field=models.ForeignKey(default=5, on_delete=django.db.models.deletion.PROTECT, related_name='+', to=settings.AUTH_USER_MODEL),
        ),
    ]
