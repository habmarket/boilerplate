COMMIT=local
DOCKER_COMPOSE=docker-compose -f docker-compose.yml

.PHONY: dev
dev:
	${DOCKER_COMPOSE} -f docker-compose.dev.yml up -d

.PHONY: prod
prod:
	${DOCKER_COMPOSE} up -d

.PHONY: build
build:
	${DOCKER_COMPOSE} build

.PHONY: push
push: build
	${DOCKER_COMPOSE} push

.PHONY: clean
clean:
	${DOCKER_COMPOSE} --rmi all

.PHONY: test
test:
	${DOCKER_COMPOSE} -f docker-compose.test.yml up -d
	${DOCKER_COMPOSE} -f docker-compose.test.yml run tester