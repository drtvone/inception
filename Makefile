DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yaml

prepare:
	echo '127.0.0.1 rturnip.42.fr' >> /etc/hosts 
	echo '127.0.0.1 www.rturnip.42.fr' >> /etc/hosts
	mkdir -p /home/rturnip/data/wp
	mkdir -p /home/rturnip/data/db
start:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up
down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down
re:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up --build
stop:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) stop
clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q)
git:
	git add *
	git commit -m "inception"
	git push

.PHONY: start down stop
