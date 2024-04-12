.PHONY: help run stop check rebuild restart
.DEFAULT_GOAL := help

help:
	@echo -e '\033[0;31m Available commands:'
	@echo -e '\033[0;32m run \033[1;37m\t\t - \t run container'
	@echo -e '\033[0;32m stop \033[1;37m\t\t - \t stop container'
	@echo -e '\033[0;32m check \033[1;37m\t\t - \t check proxy'
	@echo -e '\033[0;34m build \033[1;37m\t\t - \t rebuild container'
	@echo -e '\033[0;34m restart \033[1;37m\t - \t restart Tor inside container'

run:
	docker-compose up -d

stop:
	docker-compose down

check:
	curl -x socks5h://localhost:9350 https://check.torproject.org/api/ip

rebuild:
	docker-compose build

restart:
	./scripts/restart.sh
