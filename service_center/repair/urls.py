from django.urls import path

from repair.views import repair_index, repair_view, repair_edit, repair_new

urlpatterns = [
    # path('', TemplateView.as_view(template_name='main/index.html'), {'page_title': "Сервисный центр \"Питон\" - Главная"}),
    path('', repair_index, name='repair_root'),
    path('view/<int:order_id>/', repair_view, name='repair_view'),
    path('edit/<int:order_id>/', repair_edit, name='repair_edit'),
    path('new/', repair_new, name='repair_new'),
]
