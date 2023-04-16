# Generated by Django 4.1.7 on 2023-03-28 07:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('repair', '0005_alter_client_phone'),
    ]

    operations = [
        migrations.AddField(
            model_name='repair',
            name='defect',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AddField(
            model_name='repairorder',
            name='kit_state',
            field=models.CharField(max_length=150, null=True),
        ),
        migrations.AlterField(
            model_name='device',
            name='defect',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='device',
            name='kit_state',
            field=models.CharField(max_length=150, null=True),
        ),
        migrations.AlterField(
            model_name='repair',
            name='estimated_duration',
            field=models.PositiveIntegerField(default=5),
        ),
    ]