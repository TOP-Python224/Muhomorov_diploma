from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.models import Group
from django.core.handlers import exception
from django.core.mail import send_mail
from django.db import transaction
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.utils.decorators import method_decorator
from django.views.defaults import permission_denied
from django.views.generic import ListView, DetailView, TemplateView

from repair.forms import RepairOrderForm, ClientForm, DeviceForm, RepairForm, EmployeeCommentForm
from repair.models import RepairOrder, EmployeeComment, Client, Device
from repair.vars import GroupNumber, StatusNumber


@method_decorator(login_required, name='dispatch')
class RepairIndex(ListView):
    """
    Выводит список нарядов на ремонт.
    """
    template_name = 'repair/index.html'
    context_object_name = 'orders'
    paginate_by = 15

    def get_queryset(self):
        if Group.objects.get(user=self.request.user).id == GroupNumber.MASTER:
            queryset = RepairOrder.objects.filter(repair__employee=self.request.user.id)
        else:
            queryset = RepairOrder.objects.all()
        return queryset


@method_decorator(login_required, name='dispatch')
class RepairView(DetailView):
    """
    Выводит существующий наряд на ремонт.
    """
    template_name = 'repair/view.html'

    def get(self, request, *args, **kwargs):
        group_id = Group.objects.get(user=self.request.user).id
        order_id = self.kwargs['pk']
        order = get_object_or_404(RepairOrder, pk=order_id)
        comments = EmployeeComment.objects.filter(repair_order__pk=order_id)
        if not (group_id in (GroupNumber.ACCEPTOR, GroupNumber.MANAGER)
                or self.request.user.id == order.repair.employee.id):
            return permission_denied(request, exception, template_name='403.html')

        return render(request,
                      self.template_name,
                      context={'order': order,
                               'repair': order.repair,
                               'client': order.client,
                               'device': order.device,
                               'comments': comments})


@method_decorator(login_required, name='dispatch')
class RepairPrintOrder(RepairView):
    """
    Выводит на печать существующий наряд на ремонт.
    """
    template_name = 'repair/order.html'


@method_decorator(login_required, name='dispatch')
class RepairPrintAct(RepairView):
    """
    Выводит на печать акт к существующему наряду на ремонт.
    """
    template_name = 'repair/act.html'


@login_required
@permission_required('repair.add_repairorder', raise_exception=True)
def repair_new(request):
    """
    Создание нового наряда
    """
    if request.method == 'GET':
        order_form = RepairOrderForm()
        client_form = ClientForm()
        device_form = DeviceForm()
        repair_form = RepairForm()
        comments_form = EmployeeCommentForm()

    elif request.method == 'POST':
        order_form = RepairOrderForm(request.POST)
        client_form = ClientForm(request.POST)
        device_form = DeviceForm(request.POST)
        repair_form = RepairForm(request.POST)
        comments_form = EmployeeCommentForm(request.POST)

        if all([order_form.is_valid(),
                client_form.is_valid(),
                device_form.is_valid(),
                repair_form.is_valid(),
                comments_form.is_valid()
                ]):

            with transaction.atomic():
                order_obj = order_form.save(commit=False)
                client_obj = client_form.save(commit=False)
                client, created = Client.objects.get_or_create(
                    first_name=client_obj.first_name,
                    patronymic=client_obj.patronymic,
                    last_name=client_obj.last_name,
                    phone=client_obj.phone,
                    defaults={'email': client_obj.email,
                              'address': client_obj.address
                              }
                )
                order_obj.client = client
                device_obj = device_form.save(commit=False)
                device, created = Device.objects.get_or_create(
                    model=device_obj.model,
                    serial_number=device_obj.serial_number,
                    defaults={'vendor': device_obj.vendor,
                              'device_type': device_obj.device_type
                              }
                )
                order_obj.device = device
                order_obj.repair = repair_form.save()
                order_obj.added_by = request.user
                order_obj.save()

                if comments_form.has_changed():
                    comment_obj = comments_form.save(commit=False)
                    comment_obj.repair_order = order_obj
                    comment_obj.added_by = request.user
                    comment_obj.save()

            send_mail(
                'Новый наряд на ремонт',
                f'Вам назначен ремонт устройства {order_obj.device}.\n '
                f'Ссылка на наряд http://127.0.0.1:8000/repair/view/{order_obj.id}/',
                'root@servicepython.ru',
                [order_obj.repair.employee.email],
                fail_silently=False,
                )

            return HttpResponseRedirect(reverse('repair_root'))

    return render(request,
                  template_name='repair/new.html',
                  context={'order_form': order_form,
                           'client_form': client_form,
                           'device_form': device_form,
                           'repair_form': repair_form,
                           'comments_form': comments_form
                           }
                  )


@login_required
@permission_required('repair.change_repairorder', raise_exception=True)
def repair_edit(request, pk):
    """
    Редактирование существующего наряда.
    """
    group_id = Group.objects.get(user=request.user).id
    order = get_object_or_404(RepairOrder, pk=pk)
    client = order.client
    device = order.device
    repair = order.repair
    comments = EmployeeComment.objects.filter(repair_order__pk=pk)
    status_id = repair.status.id

    if group_id == GroupNumber.MASTER and request.user.id != order.repair.employee.id:
        return permission_denied(request, exception, template_name='403.html')

    if request.method == 'GET':
        order_form = RepairOrderForm(instance=order)
        client_form = ClientForm(instance=client)
        device_form = DeviceForm(instance=device)
        repair_form = RepairForm(instance=repair)
        comments_form = EmployeeCommentForm()

    elif request.method == 'POST':
        order_form = RepairOrderForm(request.POST, instance=order)
        client_form = ClientForm(request.POST, instance=client)
        device_form = DeviceForm(request.POST, instance=device)
        repair_form = RepairForm(request.POST, instance=repair)
        comments_form = EmployeeCommentForm(request.POST)

        if all([order_form.is_valid(),
                client_form.is_valid(),
                device_form.is_valid(),
                repair_form.is_valid(),
                comments_form.is_valid()]):

            with transaction.atomic():
                order_obj = order_form.save()
                client_form.save()
                device_form.save()
                repair_form_obj = repair_form.save()

                if comments_form.has_changed():
                    comment_obj = comments_form.save(commit=False)
                    comment_obj.repair_order = order_obj
                    comment_obj.added_by = request.user
                    comment_obj.save()

            if repair_form_obj.status.id == StatusNumber.ENDED \
                    and status_id != StatusNumber.ENDED \
                    and client.email:
                send_mail(
                    'Сообщение из СЦ "Питон"',
                    f'Ремонт Вашего устройства {device} закончен, пожалуйста заберите его в СЦ "Питон".',
                    'root@servicepython.ru',
                    [client.email],
                    fail_silently=False,
                )

            return HttpResponseRedirect(reverse('repair_root'))

    return render(request,
                  template_name='repair/edit.html',
                  context={
                           'order_form': order_form,
                           'client_form': client_form,
                           'device_form': device_form,
                           'repair_form': repair_form,
                           'comments': comments,
                           'comments_form': comments_form
                          }
                  )


@method_decorator(login_required, name='dispatch')
class CatalogIndex(TemplateView):
    """
    Выводит список справочников.
    """
    template_name = 'repair/catalog.html'


@method_decorator(login_required, name='dispatch')
class CatalogCreateItem(ListView):
    """
    Выводит список элементов справочника с формой для добавления новых элементов.
    """
    form_class = None
    success_url = None
    template_name = 'repair/catalog_items.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = self.form_class()
        return context

    def post(self, request):
        form = self.form_class(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(self.success_url)
        else:
            return self.get(request)
