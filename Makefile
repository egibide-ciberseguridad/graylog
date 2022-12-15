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
	@echo -------------------------------------------------------------
	@echo start
	@echo stop / stop-all
	@echo stats / logs
	@echo clean
	@echo -------------------------------------------------------------

_header:
	@echo ---------
	@echo Graylog
	@echo ---------

_start:
	@docker compose up -d https-portal

start: _start _urls

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
	@echo ---------------------------------
	@echo [Graylog] https://graylog.test
	@echo ---------------------------------
