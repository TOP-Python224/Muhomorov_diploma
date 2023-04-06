from datetime import date

from django import forms
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.forms import Textarea, NumberInput

from repair.models import RepairOrder, Client, Device, Repair, EmployeeComment
from repair.vars import GroupNumber


class RepairOrderForm(forms.ModelForm):
    estimated_price = forms.IntegerField(
        min_value=0,
        label='Предполагаемая стоимость',
        initial=0
    )
    final_price = forms.IntegerField(
        min_value=0,
        label='Окончательная стоимость',
        initial=0
    )

    def clean_return_date(self):
        return_date = self.cleaned_data['return_date']
        if return_date is not None and return_date < date.today():
            raise ValidationError('Дата не может быть меньше сегодняшней!')
        return return_date

    class Meta:
        model = RepairOrder
        fields = ('accept_date', 'return_date', 'estimated_price', 'final_price', 'kit_state')
        labels = {
            'accept_date': 'Дата приемки',
            'return_date': 'Дата возврата',
            'kit_state': 'Комплектация и состояние'
        }
        widgets = {
            'kit_state': Textarea(attrs={'cols': 50, 'rows': 3}),
        }


class ClientForm(forms.ModelForm):
    phone = forms.IntegerField(min_value=100000, max_value=99999999999, label='Телефон')

    class Meta:
        model = Client
        fields = '__all__'
        labels = {
            'first_name': 'Имя',
            'patronymic': 'Отчество',
            'last_name': 'Фамилия',
            'email': 'Электронная почта',
            'address': 'Адрес',
        }
        widgets = {
            'phone': NumberInput(),
            'address': Textarea(attrs={'cols': 50, 'rows': 1})
        }


class DeviceForm(forms.ModelForm):

    class Meta:
        model = Device
        fields = '__all__'
        labels = {
            'model': 'Модель',
            'serial_number': 'Серийный номер',
            'kit_state': 'Комплектация и состояние',
            'device_type': 'Тип устройства',
            'vendor': 'Производитель',
        }


class RepairForm(forms.ModelForm):
    employee = forms.ModelChoiceField(queryset=User.objects.filter(groups=GroupNumber.MASTER), label='Мастер')

    class Meta:
        model = Repair
        fields = '__all__'
        labels = {
            'is_visiting': 'Выездной ремонт',
            'repair_type': 'Тип ремонта',
            'status': 'Статус ремонта',
            'estimated_duration': 'Предполагаемый срок',
            'defect': 'Неисправность',
        }
        widgets = {
            'defect': Textarea(attrs={'cols': 50, 'rows': 6}),
        }


class EmployeeCommentForm(forms.ModelForm):

    class Meta:
        model = EmployeeComment
        fields = ('comment',)
        labels = {
            'comment': 'Новый комментарий',
        }
        widgets = {
            'comment': Textarea(attrs={'cols': 100, 'rows': 1})
        }
