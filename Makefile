ARCHIVE:="django_deploy.tar"
CURRENT_DIR:=$(CURDIR)

release: start deploy

start:
	ansible-playbook -i ansible-django-deploy/hosts ansible-django-deploy/root-playbook.yml

deploy:
	tar -cf /tmp/$(ARCHIVE) *
	ansible-playbook -i ansible-django-deploy/hosts ansible-django-deploy/user-playbook.yml
	rm -rf /tmp/$(ARCHIVE)
