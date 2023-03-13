from django import forms
from repair.models import RepairOrder, Client


class RepairOrderForm(forms.ModelForm):

    class Meta:
        fields = '__all__'
        model = RepairOrder
