from decouple import config
from config.db_url import PgUrl
# import dj_database_url
# from dj_database_url import parse as db_url
from .base import *  # noqa


SECRET_KEY = config('DJANGO_SECRET_KEY')
DEBUG = False
ALLOWED_HOSTS = config(
    'DJANGO_ALLOWED_HOSTS',
    cast=lambda v: [s.strip() for s in v.split(',')]
)

DATABASES = {
    # use my own
    'default': PgUrl(config('DATABASE_URL')).to_dict()
}
