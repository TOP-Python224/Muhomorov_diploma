from django.apps import AppConfig
from django.conf import settings


class RepairConfig(AppConfig):
    default_auto_field = 'django.db.models.AutoField'
    name = 'repair'

    def ready(self):
        from .scheduler import scheduler
        if settings.SCHEDULER_AUTOSTART:
            scheduler.start()
