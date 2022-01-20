import dj_database_url
from decouple import config
from .base import *  # noqa

SECRET_KEY = 'django-insecure-ibi@xb(j2k@r&%*(*&(^%$%^$%^^&)))5_niq9erpkv%*!&!m9hp'
DEBUG = True
ALLOWED_HOSTS = []

DATABASES = {
    'default': dj_database_url.config(default=config('SQLITE_DB'))
}
