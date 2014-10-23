
release: start deploy

start:
	ansible-playbook -i root-hosts root-playbook.yml

deploy:
	ansible-playbook -i user-hosts user-playbook.yml