build:
	docker-compose -f docker/docker-compose.yml build

run:
	docker-compose -f docker/docker-compose.yml up

daemon:
	docker-compose -f docker/docker-compose.yml up -d

stop:
	docker-compose -f docker/docker-compose.yml down

logs:
	docker-compose -f docker/docker-compose.yml logs -f

shell:
	docker-compose -f docker/docker-compose.yml exec streaming-server /bin/bash
