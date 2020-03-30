build:
	docker-compose -f docker/docker-compose.yml build

run: build
	docker-compose -f docker/docker-compose.yml up

daemon: build
	docker-compose -f docker/docker-compose.yml up -d

stop:
	docker-compose -f docker/docker-compose.yml down
