from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group
from django.http import HttpResponse, HttpResponseForbidden, HttpResponseNotFound
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render

from repair.forms import RepairOrderForm
from repair.models import RepairOrder, EmployeeComment


@login_required
def repair_index(request):
    group_id = Group.objects.get(user=request.user).id
    if group_id == 1:
        orders = RepairOrder.objects.filter(repair__employee=request.user.id).order_by("-accept_date")
    else:
        orders = RepairOrder.objects.order_by("-accept_date")

    return render(request, template_name='repair/index.html', context={'orders': orders})


@login_required
def repair_view(request, order_id):
    try:
        user_id_from_order = RepairOrder.objects.get(pk=order_id).repair.employee.id
    except ObjectDoesNotExist:
        return HttpResponseNotFound('Наряд с таким номером не существует!')

    user_id_from_request = request.user.id
    group_id = Group.objects.get(user=request.user).id
    order = RepairOrder.objects.get(pk=order_id)
    client = order.client
    repair = order.repair
    device = order.device
    comments = EmployeeComment.objects.filter(repair_order__pk=order_id).order_by("-date")

    if group_id in (2, 3) or user_id_from_request == user_id_from_order:
        return render(request,
                      template_name='repair/view.html',
                      context={'order': order,
                               'client': client,
                               'repair': repair,
                               'device': device,
                               'comments': comments}
                      )
    else:
        return HttpResponseForbidden(f'Ремонт по наряду №{order_id} выполняет другой мастер! '
                                     f'Вы не можете просматривать наряды других мастеров!')


def repair_edit(request, order_id):
    return HttpResponse(f'Edit order №{order_id}!')


def repair_new(request):
    if request.method == 'GET':
        form = RepairOrderForm
    elif request.method == 'POST':
        form = RepairOrderForm(request.POST)

    print(f'{form = }')
    return render(request, 'repair/new.html', {'form': form})
