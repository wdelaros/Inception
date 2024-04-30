all: build up

build:
	docker-compose -f ./srcs/docker-compose.yml build

up:
	@docker compose -f ./srcs/docker-compose.yml up

down:
	docker-compose -f ./srcs/docker-compose.yml down

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

ps:
	docker ps

nuke:
	./docker-utils.sh