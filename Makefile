clean:
	rm -f ./gen/* ./gen/.* || true

build: gen
	docker-compose build

gen: build-template-tool
	./gen.sh

build-template-tool:
	go build -o ./bin/template_tool ./internal/cmd/template_tool

build-env-file: build-template-tool
	./bin/template_tool --template ./template/.env.tmpl --config ./config.json --out ./gen/.env

build-aws-credentials: build-template-tool
	./bin/template_tool --template ./template/credentials.tmpl --config ./config.json --out ./gen/credentials
	chmod 600 ./gen/credentials

run: build-env-file
	docker-compose up

daemon: build-env-file
	docker-compose up -d

stop:
	docker-compose down

logs:
	docker-compose logs -f

shell:
	docker-compose exec streaming-server /bin/bash
