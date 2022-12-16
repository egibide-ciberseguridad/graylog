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
	@echo clean / clean-containers-networks
	@echo ---------------------------------

_header:
	@echo -------
	@echo Graylog
	@echo -------

_start:
	@docker compose up -d graylog

start: _header _start _urls

_start-external-network:
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

clean-containers-networks:
	@docker compose down --remove-orphans

_urls: _header
	${info }
	@echo -----------------------------------
	@echo [Graylog] http://localhost:9000
	@echo [MailCatcher] http://localhost:1080
	@echo -----------------------------------
