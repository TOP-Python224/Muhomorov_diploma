# Generated by Django 4.1.7 on 2023-03-28 13:24

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('repair', '0008_alter_repair_defect_alter_repairorder_kit_state'),
    ]

    operations = [
        migrations.AddField(
            model_name='repairorder',
            name='added_by',
            field=models.ForeignKey(default=5, on_delete=django.db.models.deletion.PROTECT, related_name='to_user', to=settings.AUTH_USER_MODEL),
        ),
    ]