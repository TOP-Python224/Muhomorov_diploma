from sys import stdout
from enum import IntEnum
from datetime import date, timedelta
from os import environ

from apscheduler.schedulers.background import BackgroundScheduler
from apscheduler.triggers.cron import CronTrigger
from django.core.mail import send_mail
from django_apscheduler.jobstores import DjangoJobStore
from django.conf import settings

from repair.models import Repair


class StatusNumber(IntEnum):
    WORKED = 1
    ORDERED = 2
    ACCEPTED = 6


def check_overdue_repairs():
    current_repairs = Repair.objects.filter(status__in=[StatusNumber.WORKED,
                                                        StatusNumber.ORDERED,
                                                        StatusNumber.ACCEPTED])
    for repair in current_repairs:
        if date.today() - repair.repairorder.accept_date > timedelta(days=repair.estimated_duration):
            send_mail('Уведомление о просроченном ремонте',
                      f'Вами просрочен ремонт устройства {repair.repairorder.device}.\n'
                      f'Ссылка на наряд http://127.0.0.1:8000/repair/view/{repair.repairorder.id}/',
                      'root@service-python.ru',
                      [repair.employee.email],
                      fail_silently=False,)


scheduler = BackgroundScheduler(timezone=settings.TIME_ZONE)
scheduler.add_jobstore(DjangoJobStore(), "default")
scheduler.add_job(check_overdue_repairs,
                  id='check_overdue_repairs',
                  # trigger=CronTrigger(minute='*/5'),
                  trigger=CronTrigger(hour='0', minute='5'),
                  replace_existing=True,
                  max_instances=1
                  )


def start():
    if environ.get('RUN_MAIN'):
        scheduler.start()
        print("Scheduler started...", file=stdout)

