CONTAINER := nginx wordpress mariadb
IMAGES := nginx wordpress mariadb
VOLUMES := database wordpress

all: up

up:
	@cd srcs/ && docker compose up --build -d

down:
	@cd srcs/ && docker compose down

stop:
	@cd srcs/ && docker compose stop

start:
	@cd srcs/ && docker compose start

status:
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

cleanvolume:
	@for volumes in $(VOLUMES); do \
		if docker inspect $$volumes &>/dev/null; then \
			docker volume rm -f $$volumes; \
		fi; \
	done

cleanimages:
	@for image in $(IMAGES); do \
		if docker inspect $$image &>/dev/null; then \
			docker rmi -f $$image; \
		fi; \
	done

fclean: down cleanimages cleanvolume
	@docker system prune -f

reset: fclean
	cd /home/hkumbhan/data/ && rm -rf database wordpress && \
	mkdir database wordpress


help:
	@echo "Available targets:"
	@echo "  up        - Build and start all containers"
	@echo "  down      - Stop and remove all containers"
	@echo "  start     - Start all containers"
	@echo "  stop      - Stop all containers"
	@echo "  status    - Show status of containers"
	@echo "  fclean    - clean all containers, images and volumes"
	@echo "  reset     - Reset whole project and build from scratch"
