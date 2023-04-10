from datetime import date

from django.db import models
from django.contrib.auth.models import User


class Vendor(models.Model):
    """Описывает производителей."""
    id = models.SmallAutoField(primary_key=True)
    name = models.CharField(max_length=30, unique=True)

    class Meta:
        db_table = 'vendors'

    def __str__(self):
        return self.name


class DeviceType(models.Model):
    """Описывает типы техники."""
    id = models.SmallAutoField(primary_key=True)
    name = models.CharField(max_length=30, unique=True)

    class Meta:
        db_table = 'device_types'

    def __str__(self):
        return self.name


class Device(models.Model):
    """Описывает конкретные единицы ремонтируемой техники."""
    vendor = models.ForeignKey(Vendor, models.PROTECT)
    device_type = models.ForeignKey(DeviceType, models.PROTECT)
    model = models.CharField(max_length=30)
    serial_number = models.CharField(max_length=30)

    def validate_unique(self, exclude=None):
        super().validate_unique(exclude={'model', 'serial_number'})

    class Meta:
        db_table = 'devices'
        unique_together = ['model', 'serial_number']

    def __str__(self):
        return f"{self.device_type} {self.vendor} {self.model}"


class Client(models.Model):
    """Описывает клиентов."""
    first_name = models.CharField(max_length=25)
    patronymic = models.CharField(max_length=25)
    last_name = models.CharField(max_length=25)
    email = models.EmailField(max_length=50, blank=True)
    phone = models.BigIntegerField()
    address = models.CharField(max_length=75)

    def validate_unique(self, exclude=None):
        super().validate_unique(exclude={'first_name', 'patronymic', 'last_name', 'phone'})

    class Meta:
        db_table = 'clients'
        unique_together = ['first_name', 'patronymic', 'last_name', 'phone']

    def __str__(self):
        return f"{self.last_name} {self.first_name} {self.patronymic}"


class EmployeeComment(models.Model):
    """Описывает комментарии сотрудников."""
    date = models.DateTimeField(auto_now=True)
    repair_order = models.ForeignKey('RepairOrder', models.PROTECT, default=None)
    added_by = models.ForeignKey(User, models.PROTECT)
    comment = models.CharField(max_length=100, blank=True)

    class Meta:
        db_table = 'employee_comments'
        ordering = ['-date']

    def __str__(self):
        return f"{self.date}, {self.added_by}, {self.comment}"


class RepairType(models.Model):
    """Описывает типы ремонтов."""
    id = models.SmallAutoField(primary_key=True)
    name = models.CharField(max_length=30, unique=True)

    class Meta:
        db_table = 'repair_types'

    def __str__(self):
        return self.name


class RepairStatus(models.Model):
    """Описывает статусы ремонтов."""
    id = models.SmallAutoField(primary_key=True)
    name = models.CharField(max_length=30, unique=True)

    class Meta:
        db_table = 'repair_statuses'
        verbose_name_plural = "Repair Statuses"

    def __str__(self):
        return self.name


class Repair(models.Model):
    """Описывает конкретные ремонты."""
    status = models.ForeignKey(RepairStatus, models.PROTECT)
    estimated_duration = models.PositiveIntegerField(default=5)
    repair_type = models.ForeignKey(RepairType, models.PROTECT)
    is_visiting = models.BooleanField(default=False)
    employee = models.ForeignKey(User, models.PROTECT)
    defect = models.CharField(max_length=300)

    class Meta:
        db_table = 'repairs'


class RepairOrder(models.Model):
    """Описывает принятия на ремонты."""
    accept_date = models.DateField(default=date.today)
    return_date = models.DateField(null=True, blank=True)
    estimated_price = models.DecimalField(max_digits=8,
                                          decimal_places=2,
                                          default=0)
    final_price = models.DecimalField(max_digits=8,
                                      decimal_places=2,
                                      default=0)

    client = models.ForeignKey(Client, models.PROTECT)
    device = models.ForeignKey(Device, models.PROTECT)
    repair = models.OneToOneField(Repair, models.PROTECT)

    employee = models.ManyToManyField(
        User,
        through=EmployeeComment,
        through_fields=('repair_order', 'added_by'),
    )
    kit_state = models.CharField(max_length=150)
    added_by = models.ForeignKey(User, models.PROTECT, related_name='+')

    class Meta:
        db_table = 'repair_orders'
        ordering = ['-accept_date', '-id']

    def __str__(self):
        return f"Наряд №{self.pk} от {self.accept_date}"


def get_full_name(self):
    return f"{self.first_name} {self.last_name}"


User.add_to_class("__str__", get_full_name)
