from django.urls import path
from repair.views import RepairIndex, repair_new, repair_edit, RepairView, RepairPrint

urlpatterns = [
    path('', RepairIndex.as_view(), name='repair_root'),
    path('view/<int:pk>/', RepairView.as_view(), name='repair_view'),
    path('print/<int:pk>/', RepairPrint.as_view(), name='repair_print'),
    path('new/', repair_new, name='repair_new'),
    path('edit/<int:pk>/', repair_edit, name='repair_edit'),
]
