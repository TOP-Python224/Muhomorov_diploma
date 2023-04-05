from django import forms
from captcha.fields import CaptchaField


class StatusForm(forms.Form):
    number = forms.IntegerField(
        label='Введите номер наряда:',
        min_value=1,
        max_value=100000,
    )
    captcha = CaptchaField(
        label='Введите результат:'
    )

