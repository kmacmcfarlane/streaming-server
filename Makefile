all: daemon

build:
	docker-compose build

start:
	docker-compose up --build

daemon:
	docker-compose up --build -d
	make logs

stop:
	docker-compose down

logs:
	docker-compose logs -f

shell:
	docker-compose exec streaming-server /bin/bash
