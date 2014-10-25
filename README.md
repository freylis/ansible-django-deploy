Django deploying scripts
========================

Library or simple deploying django-projects

What we have:
django project at local machine with structure:

    example/
        manage.py
        example/
            settings.py
            # etc
        # etc

And we need to deploy this project for remote host 192.168.0.100
with creating new user `hostuser` (optionally) at ubuntu 14.04 (not tested at another versions)

Usage
-----

1. install [ansible](http://docs.ansible.com/intro_installation.html)
2. clone repository to your django `example` project:
```
git clone git@github.com:freylis/ansible-django-deploy.git
```

3. Copy `Makefile` to you root project directory
```
cp django-deploy/Makefile .
```

4. configure `django-deploy/hosts` file:
```
# usually YOU_USER_PASSWORD = YOU_SUDO_USER_PASSWORD
root ansible_ssh_host=192.168.0.100 ansible_ssh_user=YOUR_SUDO_USERNAME ansible_ssh_pass=YOU_USER_PASSWORD ansible_sudo_pass=YOU_SUDO_USER_PASSWORD
user ansible_ssh_host=192.168.0.100 ansible_ssh_user=YOU_USER_FOR_PROJECT ansible_ssh_pass=USER_FOR_PROJECT_PASSWORD
```

5. configure `django-deploy/group_vars/project-hosts` file
```
#
# system options
#

# linux username
username:

# how to crypt your password:
# http://docs.ansible.com/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module
# or run `mkpasswd --method=SHA-512`
# here crypted password
user_crypt_password:

# really password
user_password: z

user_homedir: "/home/{{ username }}"

mysql_root_user: root   # root mysql user
mysql_root_password: ""


#
# project options
#

# project slug ( if u have `example/manage.py` and example/example/settings.py` - `example` is project_slug)
project_slug:

# url or list urls for nginx
project_url:

project_dir: "{{ user_homedir }}/projects/{{ project_slug }}"

project_homedir: "{{ user_homedir }}/projects/{{ project_slug }}/{{ project_slug }}"

# virtualenv name
env: "{{ project_dir }}/env"

# port for uwsgi, must be unique for each project
uwsgi_port: 9000

# mysql database for current project
mysql_database: "{{ project_slug }}"

# mysql user for current project
mysql_user:

# mysql user password for current project
mysql_user_password:

#
# django settings
#

debug: True
local_settings: 'local_settings.py'

# set empty string if not used
requirements: 'requirements.txt'
```

6. By SSH go to remote host. In this step you need only press `yes` when system ask you about known_hosts file

7. run deployment script:
```
# if you system is empty, and you need to install all system packages (can run only first time)
make release

# if all packages already installed and you need only deploying project changes to host machine
make deploy
```

Its all!
go to you `project_url` and smile :]

If domain not ready - add record about domain to your `/etc/hosts` file
