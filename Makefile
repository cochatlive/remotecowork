build-janus:
	docker-compose build cowork_janus_gateway

build-nodeserver:
	docker-compose build cowork_nodeserver

build-ui:
	docker-compose build cowork_ui

start-janus:
	docker-compose up -d cowork_janus_gateway

start-nodeserver:
	docker-compose up -d cowork_nodeserver

start-ui:
	docker-compose up -d cowork_ui

build-all: build-ui build-nodeserver build-janus

start-all: stop-all start-ui start-nodeserver start-janus

submodules:
	git submodule update --init --recursive
	git submodule foreach --recursive git checkout master


all: build-all start-all

stop-all:
	docker-compose kill cowork_janus_gateway
	docker-compose kill cowork_nodeserver
	docker-compose kill cowork_ui

push-all:
	docker-compose push cowork_janus_gateway
	docker-compose push cowork_nodeserver
	docker-compose push cowork_ui

pull-all:
	docker-compose pull cowork_janus_gateway
	docker-compose pull cowork_nodeserver
	docker-compose pull cowork_ui