from django.core.management import BaseCommand
from repair.models import DeviceType, RepairStatus, RepairType, Vendor
from json import load as jload
from core.settings import BASE_DIR

models = [DeviceType, RepairStatus, RepairType, Vendor]
json_dir = BASE_DIR / 'repair/json'


class Command(BaseCommand):
    """Заполняет модели справочников данными из json-файлов.
    Имена файлов должны соответствовать названиям моделей с учетом регистра, файлы должны иметь расширения .json."""
    def handle(self, *args, **options):
        for model in models:
            with open(json_dir / (model.__name__ + '.json'), encoding='utf-8') as filein:
                items = jload(filein)
            for item in items:
                model.objects.create(name=item)

        self.stdout.write('Справочники успешно заполнены данными')
