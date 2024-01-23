#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo ---------------------------------
	@echo start / start-external-network
	@echo stop / stop-all
	@echo stats / logs
	@echo clean / clean-networks
	@echo secret / hash
	@echo ---------------------------------

_header:
	@echo -------
	@echo Graylog
	@echo -------

_start:
	@docker compose up -d graylog

start: _header _start _urls

_start-external-network:
	@-docker network create --driver bridge ${EXTERNAL_NETWORK}
	@docker compose -f docker-compose.yml -f docker-compose.network.yml up -d graylog

start-external-network: _header _start-external-network _urls

stop:
	@docker compose stop

stop-all:
	@docker stop $(shell docker ps -aq)

stats:
	@docker stats

logs:
	@docker compose logs graylog

clean:
	@docker compose down -v --remove-orphans
	@-docker network rm -f ${EXTERNAL_NETWORK}

clean-networks:
	@docker compose down --remove-orphans
	@-docker network rm -f ${EXTERNAL_NETWORK}

secret:
	@docker run --rm alpine /bin/sh -c 'cat /dev/urandom | LC_ALL=C tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1'

hash:
	@docker run -it --rm alpine /bin/sh -c 'echo -n "Enter Password: " && head -1 < /dev/stdin | tr -d "\n" | sha256sum | cut -d " " -f1'

_urls: _header
	${info }
	@echo -----------------------------------
	@echo [Graylog] http://localhost:9000
	@echo [MailCatcher] http://localhost:1080
	@echo -----------------------------------
