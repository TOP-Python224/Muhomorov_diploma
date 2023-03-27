from django.contrib import admin

from repair.models import *


@admin.register(Vendor)
class VendorAdmin(admin.ModelAdmin):
    pass


@admin.register(DeviceType)
class DeviceTypeAdmin(admin.ModelAdmin):
    pass


@admin.register(Device)
class DeviceAdmin(admin.ModelAdmin):
    pass


@admin.register(Client)
class ClientAdmin(admin.ModelAdmin):
    pass


@admin.register(EmployeeComment)
class EmployeeCommentAdmin(admin.ModelAdmin):
    pass


@admin.register(RepairType)
class RepairTypeAdmin(admin.ModelAdmin):
    pass


@admin.register(RepairStatus)
class RepairStatusAdmin(admin.ModelAdmin):
    pass


@admin.register(Repair)
class RepairAdmin(admin.ModelAdmin):
    pass


@admin.register(RepairOrder)
class RepairOrderAdmin(admin.ModelAdmin):
    pass

