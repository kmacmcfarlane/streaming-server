build:
	docker-compose -f docker/docker-compose.yml build

run: build
	docker-compose -f docker/docker-compose.yml up

stop:
	docker-compose -f docker/docker-compose.yml down
