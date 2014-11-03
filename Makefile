ARCHIVE:="django_deploy.tar"

dev-release: dev-start dev-deploy

dev-start:
	ansible-playbook -i ansible-django-deploy/hosts/dev-hosts --extra-vars="deploy=dev" ansible-django-deploy/root-playbook.yml

dev-deploy:
	tar -cf /tmp/$(ARCHIVE) *
	ansible-playbook -i ansible-django-deploy/hosts/dev-hosts --extra-vars="deploy=dev" ansible-django-deploy/user-playbook.yml
	rm -rf /tmp/$(ARCHIVE)


production-release: production-start production-deploy

production-start:
	ansible-playbook -i ansible-django-deploy/hosts/production-hosts --extra-vars="deploy=production" ansible-django-deploy/root-playbook.yml

production-deploy:
	tar -cf /tmp/$(ARCHIVE) *
	ansible-playbook -i ansible-django-deploy/hosts/production-hosts --extra-vars="deploy=production" ansible-django-deploy/user-playbook.yml
	rm -rf /tmp/$(ARCHIVE)


