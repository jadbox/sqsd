DOCKER_IMAGE_NAME=jadbox/sqsd
build: Dockerfile
	docker build -t ${DOCKER_IMAGE_NAME} .

run: build
	docker run -it --name=sqsd --env-file ./.env --rm ${DOCKER_IMAGE_NAME} ${ARGS}

local: run
	@echo "no op"
