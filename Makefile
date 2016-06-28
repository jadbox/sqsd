DOCKER_IMAGE_NAME=jadbox/sqsd
build: Dockerfile
	docker build -t ${DOCKER_IMAGE_NAME} .

run: build
	docker run -it --name=sqsd --env-file ./.env --rm ${DOCKER_IMAGE_NAME} ${ARGS}

local: build
	docker run -it --link sqsd_worker --name=sqsd --env-file ./.env --rm ${DOCKER_IMAGE_NAME} ${ARGS}

echo:
	docker run -ti -p 8800:8800 --name sqsd_worker --rm luisbebop/echo-server
