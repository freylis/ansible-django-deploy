ARCHIVE:="django_deploy.tar"

release: start deploy

start:
	ansible-playbook -i hosts root-playbook.yml

deploy:
	tar -cf /tmp/$(ARCHIVE) ../*
	ansible-playbook -i hosts user-playbook.yml
	rm -rf /tmp/$(ARCHIVE)