from django.urls import path
from django.views.generic import TemplateView
from main.views import *

urlpatterns = [
    # path('', TemplateView.as_view(template_name='main/index.html'), {'page_title': "Сервисный центр \"Питон\" - Главная"}),
    path('', root_index, name='root'),
    path('about', about_index, name='about'),
    path('certs', certs_index, name='certs'),
    path('services', services_index, name='services'),
    path('contacts', contacts_index, name='contacts'),
    path('status', status_index, name='status'),
    # path('status', StatusFormView.as_view(), name='status'),
]
