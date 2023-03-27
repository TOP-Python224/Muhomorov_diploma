from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group
from django.http import HttpResponseForbidden, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.utils.decorators import method_decorator
from django.views.generic import ListView, DetailView

from repair.forms import RepairOrderForm, ClientForm, DeviceForm, RepairForm, EmployeeCommentForm
from repair.models import RepairOrder, EmployeeComment


@method_decorator(login_required, name='dispatch')
class RepairIndex(ListView):
    """
    Выводит список нарядов на ремонт.
    """
    template_name = 'repair/index.html'
    context_object_name = 'orders'
    paginate_by = 5

    def get_queryset(self):
        if Group.objects.get(user=self.request.user).id == 1:
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
        if not (group_id in (2, 3) or self.request.user.id == order.repair.employee.id):
            return HttpResponseForbidden(f'Ремонт по наряду №{order_id} выполняет другой мастер!'
                                         f'Вы не можете просматривать наряды других мастеров!')

        return render(request,
                      self.template_name,
                      context={'order': order,
                               'repair': order.repair,
                               'client': order.client,
                               'device': order.device,
                               'comments': comments})


@method_decorator(login_required, name='dispatch')
class RepairPrint(RepairView):
    """
    Выводит на печать существующий наряд на ремонт.
    """
    template_name = 'repair/print.html'


@login_required
def repair_new(request):
    """
    Создание нового наряда
    """
    if Group.objects.get(user=request.user).id != 2:
        return HttpResponseForbidden('Вы не можете создавать наряды!')

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
            order_obj = order_form.save(commit=False)
            order_obj.client = client_form.save()
            order_obj.device = device_form.save()
            order_obj.repair = repair_form.save()
            order_obj.save()

            if comments_form.has_changed():
                comment_obj = comments_form.save(commit=False)
                comment_obj.repair_order = order_obj
                comment_obj.added_by = request.user
                comment_obj.save()

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
def repair_edit(request, pk):
    """
    Редактирование существующего наряда
    """
    group_id = Group.objects.get(user=request.user).id
    order = RepairOrder.objects.get(pk=pk)
    client = order.client
    device = order.device
    repair = order.repair
    comments = EmployeeComment.objects.filter(repair_order__pk=pk)
    status_id = repair.status.id

    if not (group_id == 2 or request.user.id == order.repair.employee.id):
        return HttpResponseForbidden(f'Ремонт по наряду №{order.pk} выполняет другой мастер!'
                                     f'Вы не можете редактировать наряды других мастеров!')

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
            order_obj = order_form.save()
            client_form.save()
            device_form.save()
            repair_form_obj = repair_form.save()

            if repair_form_obj.status.id == 3 \
                    and status_id != 3 \
                    and client.email:
                print('Ready!')

            if comments_form.has_changed():
                comment_obj = comments_form.save(commit=False)
                comment_obj.repair_order = order_obj
                comment_obj.added_by = request.user
                comment_obj.save()

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
