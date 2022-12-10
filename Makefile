# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Colors definitions                                                          │
# └─────────────────────────────────────────────────────────────────────────────┘
CR=\033[0;31m
CG=\033[0;32m
CY=\033[0;33m
CB=\033[0;36m
RC=\033[0m

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ API container commands                                                      │
# └─────────────────────────────────────────────────────────────────────────────┘
.PHONY: bash
bash:
	@docker exec -it imc_calculator_server bash

.PHONY: migrate
migrate:
	@docker exec -it hman bash -c "php artisan migrate"

.PHONY: migrate-fresh
migrate-fresh:
	@docker exec -it hman bash -c "php artisan migrate:fresh"

.PHONY: seed
seed:
	@docker exec -it hman bash -c "php artisan db:seed"

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Infra commands                                                              │
# └─────────────────────────────────────────────────────────────────────────────┘
.PHONY: build
build:
	@docker-compose -f .docker/docker-compose.yml --env-file .docker/.env build

.PHONY: start
start:
	@docker-compose -f .docker/docker-compose.yml --env-file .docker/.env up -d

.PHONY: stop
stop:
	@docker-compose -f .docker/docker-compose.yml --env-file .docker/.env down

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Build assets                                                                │
# └─────────────────────────────────────────────────────────────────────────────┘
.PHONY: npm-install
npm-install:
	@docker exec -it imc_calculator_server bash -c "npm install"

.PHONY: watch
watch:
	@docker exec -it imc_calculator_server bash -c "yarn watch"

.PHONY: hot
hot:
	@docker exec -it imc_calculator_server bash -c "yarn hot"
