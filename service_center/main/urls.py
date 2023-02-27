from django.urls import path
from main.views import main_index

urlpatterns = [
    path('', main_index)
]