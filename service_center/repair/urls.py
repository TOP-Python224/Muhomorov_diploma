from django.urls import path
from repair.views import RepairIndex, repair_new, repair_edit, RepairView, RepairPrintOrder, RepairPrintAct

urlpatterns = [
    path('', RepairIndex.as_view(), name='repair_root'),
    path('view/<int:pk>/', RepairView.as_view(), name='repair_view'),
    path('print/<int:pk>/order/', RepairPrintOrder.as_view(), name='repair_print_order'),
    path('print/<int:pk>/act/', RepairPrintAct.as_view(), name='repair_print_act'),
    path('new/', repair_new, name='repair_new'),
    path('edit/<int:pk>/', repair_edit, name='repair_edit'),
]
