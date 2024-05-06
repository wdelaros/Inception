VOLUME_DIR=/home/wdelaros/data
WORDPRESS_DIR=$(VOLUME_DIR)/wordpress
MARIADB_DIR=$(VOLUME_DIR)/mariadb

all: $(MARIADB_DIR) $(WORDPRESS_DIR) build up

$(MARIADB_DIR): $(VOLUME_DIR)
	mkdir -p $(MARIADB_DIR)

$(WORDPRESS_DIR): $(VOLUME_DIR)
	mkdir -p $(WORDPRESS_DIR)

$(VOLUME_DIR):
	mkdir -p $(VOLUME_DIR)

build:
	docker compose -f ./srcs/docker-compose.yml build

up:
	@docker compose -f ./srcs/docker-compose.yml up

down:
	docker compose -f ./srcs/docker-compose.yml down

start:
	docker compose -f ./srcs/docker-compose.yml start

stop:
	docker compose -f ./srcs/docker-compose.yml stop

logs:
	docker compose -f ./srcs/docker-compose.yml logs

nginx:
	docker exec -it srcs-nginx-1 bash

ps:
	docker ps

clean:
	sudo rm -rf $(WORDPRESS_DIR) $(MARIADB_DIR) $(VOLUME_DIR)

fclean: clean nuke

nuke:
	./docker-utils.sh