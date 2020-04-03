build: build-template
	docker-compose -f docker/docker-compose.yml build

build-template-tool:
	go build -o ./bin ./internal/cmd/template_tool

build-template: build-template-tool
	./bin/template_tool --template ./nginx.conf.tmpl --config ./config.json --out ./nginx.conf

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
