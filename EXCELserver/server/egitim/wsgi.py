import os
import sys
from django.core.wsgi import get_wsgi_application
from whitenoise import WhiteNoise
from egitim.settings import BASE_DIR

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'egitim.settings')

application = get_wsgi_application()

