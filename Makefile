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
	@echo ----------------------
	@echo start
	@echo stop / stop-all
	@echo stats / logs
	@echo clean
	@echo ----------------------

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

_urls: _header
	${info }
	@echo -------------------------------
	@echo [Graylog] http://localhost:9000
	@echo -------------------------------
