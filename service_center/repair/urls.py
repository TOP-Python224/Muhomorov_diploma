from django.urls import path, reverse_lazy

from repair.views import RepairIndex, repair_new, repair_edit, RepairView, RepairPrintOrder, RepairPrintAct, \
    CatalogIndex, CatalogCreateItem
from repair.forms import VendorForm, DeviceTypeForm, RepairTypeForm, RepairStatusForm

catalogs_list = (VendorForm, DeviceTypeForm, RepairTypeForm, RepairStatusForm)

urlpatterns = [
    path('', RepairIndex.as_view(), name='repair_root'),
    path('view/<int:pk>/', RepairView.as_view(), name='repair_view'),
    path('print/<int:pk>/order/', RepairPrintOrder.as_view(), name='repair_print_order'),
    path('print/<int:pk>/act/', RepairPrintAct.as_view(), name='repair_print_act'),
    path('new/', repair_new, name='repair_new'),
    path('edit/<int:pk>/', repair_edit, name='repair_edit'),
    path('catalog/', CatalogIndex.as_view(), name='catalog_index'),
] + [
    path(
        f'catalog/{catalog.Meta.model.__name__.lower()}/',
        CatalogCreateItem.as_view(
                queryset=catalog.Meta.model.objects.all(),
                form_class=catalog,
                success_url=reverse_lazy(f'catalog_{catalog.Meta.model.__name__.lower()}')
        ),
        name=f'catalog_{catalog.Meta.model.__name__.lower()}')
    for catalog in catalogs_list
]
