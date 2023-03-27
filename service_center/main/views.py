from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render
from main.forms import StatusForm
from repair.models import RepairOrder

title = 'Сервисный центр \"Питон\"'

menu_items = [
    {'menu_name': 'Главная', 'url_name': 'root'},
    {'menu_name': 'О компании', 'url_name': 'about'},
    {'menu_name': 'Сертификаты', 'url_name': 'certs'},
    {'menu_name': 'Услуги', 'url_name': 'services'},
    {'menu_name': 'Контакты', 'url_name': 'contacts'},
    {'menu_name': 'Статус ремонта', 'url_name': 'status'},
    {'menu_name': 'Служебный раздел', 'url_name': 'login'},
]

common_context = {'title': title, 'menu_items': menu_items}


def root_index(request):
    return render(request,
                  'main/index.html',
                  common_context)


def about_index(request):
    return render(request,
                  'main/about.html',
                  common_context)


def certs_index(request):
    return render(request,
                  'main/certs.html',
                  common_context)


def services_index(request):
    return render(request,
                  'main/services.html',
                  common_context)


def contacts_index(request):
    return render(request,
                  'main/contacts.html',
                  common_context)


def status_index(request):
    status = ''

    if request.method == 'GET':
        form = StatusForm()

    elif request.method == 'POST':
        form = StatusForm(request.POST)
        if form.is_valid():
            number = form.cleaned_data['number']
            try:
                status = RepairOrder.objects.get(pk=number).repair.status.name
            except ObjectDoesNotExist:
                status = 'Неправильный номер наряда'

    status_context = common_context | {'form': form, 'status': status}

    return render(
        request,
        'main/status.html',
        status_context
    )
