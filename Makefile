backup: commit pull push
pull:
	git pull origin master

commit:
	git add .
	git commit -m "backup $(shell date)"

push:
	git push origin master
