# Makefile for Docker Compose

# Define the Docker Compose configuration file (change if necessary)
COMPOSE_FILE := srcs/docker-compose.yml

# Define the name of your Docker Compose project (change if necessary)
PROJECT_NAME := inception

DATA = /home/$(USER)/data
DATAWP = /home/$(USER)/data/db
DATADB = /home/$(USER)/data/wp




.PHONY: up down build start stop restart logs ps prune session-mdb session-wp session-nginx rm-volumes $(DATA) $(DATADB) $(DATAWP)

up:: $(DATA) $(DATADB) $(DATAWP)
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d

down::
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down

build::
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) build

start::
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) start

stop::
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) stop

restart:: stop
restart:: start

logs::
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs -f

ps::
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) ps

prune::
	docker system prune -af
	docker volume ls -q | xargs -I {} docker volume rm {}

session-mdb::
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) exec mariadb bash

session-wp::
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) exec wordpress bash

session-nginx::
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) exec nginx bash

rm-volumes::
	$(RM) -r /home/$(USER)/data/db/* /home/$(USER)/data/wp/*

$(DATA):
	@mkdir -p $(DATA)
	
$(DATADB):
	@mkdir -p $(DATADB)

$(DATAWP):
	@mkdir -p $(DATAWP)
