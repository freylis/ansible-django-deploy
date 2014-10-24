# coding: utf-8
import os

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': '{{ mysql_database }}',
        'USER': '{{ mysql_user }}',
        'PASSWORD': '{{ mysql_user_password }}',
        'TEST': {
            'CHARSET': 'utf8',
            'COLLATION': 'utf8_unicode_ci',
        }
    }
}

DEBUG = {{ debug }}
TEMPLATE_DEBUG = DEBUG

STATIC_ROOT = os.path.abspath(os.path.join("{{ project_dir }}", "static"))
MEDIA_ROOT = os.path.abspath(os.path.join("{{ project_dir }}", "media"))