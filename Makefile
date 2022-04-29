service := sveltekit-template-service
name := sveltekit-service
expose := 8080
env := dev

.PHONY: build

all: build run

build:

ifeq ($(env), dev)
	@echo no build target for dev env;
else
build: build-prod
endif

run:

ifeq ($(env), dev)
run: run-dev
else
run: run-prod
endif

build-prod: docker-rm-images
	docker build --no-cache -t ${service}:latest .;

run-prod: docker-rm-container docker-rm-images
	docker run --init \
		-p ${expose}:3000 \
		--network my-mogenius-net \
		--name ${name} \
		${service};

run-dev:
	cd app && npm run dev -- --open;

docker-rm-images:
	docker image prune -f; exit 0;

docker-rm-container:
	docker rm $$(docker stop $$(docker ps -a -q --filter="name=${name}" --format="{{.ID}}")); exit 0;
