from django.db import models


class Vendor(models.Model):
    """Описывает производителей."""
    id = models.SmallAutoField(primary_key=True)
    name = models.CharField(max_length=30, unique=True)

    class Meta:
        db_table = 'vendors'


class DeviceType(models.Model):
    """Описывает типы техники."""
    id = models.SmallAutoField(primary_key=True)
    name = models.CharField(max_length=30, unique=True)

    class Meta:
        db_table = 'device_types'


class Device(models.Model):
    """Описывает конкретные единицы ремонтируемой техники."""
    vendor = models.ForeignKey(Vendor, models.PROTECT)
    device_type = models.ForeignKey(DeviceType, models.PROTECT)
    model = models.CharField(max_length=30)
    serial_number = models.CharField(max_length=30)
    kit_state = models.CharField(max_length=150)
    defect = models.CharField(max_length=300)

    class Meta:
        db_table = 'devices'
        unique_together = ('model', 'serial_number')


class CommonPersonData(models.Model):
    """Описывает общие данные физических лиц."""
    first_name = models.CharField(max_length=25, help_text='Введите имя')
    patronymic = models.CharField(max_length=25)
    last_name = models.CharField(max_length=25)
    email = models.CharField(max_length=30, blank=True)
    phone = models.CharField(max_length=11)

    class Meta:
        abstract = True


class Client(CommonPersonData):
    """Описывает клиентов."""
    address = models.CharField(max_length=50)

    class Meta:
        db_table = 'clients'
        unique_together = ('first_name', 'patronymic', 'last_name', 'phone')


class EmployeeType(models.Model):
    """Описывает тип сотрудников."""
    id = models.SmallAutoField(primary_key=True)
    name = models.CharField(max_length=30)
    role = models.CharField(max_length=30)

    class Meta:
        db_table = 'employee_types'


class Employee(CommonPersonData):
    """Описывает конкретных сотрудников."""
    id = models.SmallAutoField(primary_key=True)
    email = models.EmailField
    password = models.CharField(max_length=50, default=None)
    device_type = models.ManyToManyField(DeviceType)
    last_login = models.DateTimeField(auto_now=True)
    employee_type = models.ForeignKey(EmployeeType, models.PROTECT, default=None)

    class Meta:
        db_table = 'employees'


class EmployeeComment(models.Model):
    """Описывает комментарии сотрудников."""
    date = models.DateTimeField(auto_now=True)
    repair_order = models.ForeignKey('RepairOrder', models.PROTECT, default=None)
    added_by = models.ForeignKey(Employee, models.PROTECT)
    comment = models.CharField(max_length=100)

    class Meta:
        db_table = 'employee_comments'


class RepairType(models.Model):
    """Описывает типы ремонтов."""
    id = models.SmallAutoField(primary_key=True)
    name = models.CharField(max_length=30, unique=True)

    class Meta:
        db_table = 'repair_types'


class RepairStatus(models.Model):
    """Описывает статусы ремонтов."""
    id = models.SmallAutoField(primary_key=True)
    name = models.CharField(max_length=30, unique=True)

    class Meta:
        db_table = 'repair_statuses'


class Repair(models.Model):
    """Описывает конкретные ремонты."""
    status = models.ForeignKey(RepairStatus, models.PROTECT)
    estimated_duration = models.IntegerField()
    repair_type = models.ForeignKey(RepairType, models.PROTECT)
    is_visiting = models.BooleanField(default=False)
    employee = models.ForeignKey(Employee, models.PROTECT)

    class Meta:
        db_table = 'repairs'


class RepairOrder(models.Model):
    """Описывает принятия на ремонты."""
    accept_date = models.DateField(auto_now_add=True)
    return_date = models.DateField(default=None)
    estimated_price = models.DecimalField(max_digits=8,
                                          decimal_places=2,
                                          default=0)
    final_price = models.DecimalField(max_digits=8,
                                      decimal_places=2,
                                      default=0)

    client = models.ForeignKey(Client, models.PROTECT)
    device = models.ForeignKey(Device, models.PROTECT)
    repair = models.OneToOneField(Repair, models.PROTECT)

    class Meta:
        db_table = 'repair_orders'
