clean:
	rm -f ./gen/* ./gen/.* || true

build: gen
	docker-compose -f ./gen/docker-compose.yml build

gen: build-template-tool
	./gen.sh

build-template-tool:
	go build -o ./bin/template_tool ./internal/cmd/template_tool

build-env-file: build-template-tool
	./bin/template_tool --template ./template/.env.tmpl --config ./config.json --out ./gen/.env

build-aws-credentials: build-template-tool
	./bin/template_tool --template ./template/credentials.tmpl --config ./config.json --out ./gen/credentials
	chmod 600 ./gen/credentials

run: |gen build-env-file
	docker-compose -f ./gen/docker-compose.yml up

daemon: |gen build-env-file
	docker-compose -f ./gen/docker-compose.yml up -d

stop:
	docker-compose -f ./gen/docker-compose.yml down

logs:
	docker-compose -f ./gen/docker-compose.yml logs -f

shell:
	docker-compose -f ./gen/docker-compose.yml exec streaming-server /bin/bash
