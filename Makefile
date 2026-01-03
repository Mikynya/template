# -----------------------------------------------------------------------------
# Development (Локальная разработка)
# -----------------------------------------------------------------------------

.PHONY: ci-build-dev
ci-build-dev:
	@echo "🔄 Пересборка без кэша..."
	docker compose build

.PHONY: up
up:
	@echo "🚀 Запускаем в режиме DEV (с hot-reload)..."
	docker compose up --build

.PHONY: up-d
up-d:
	@echo "🚀 Запускаем в режиме DEV в фоне..."
	docker compose up --build -d

.PHONY: down
down:
	@echo "🛑 Останавливаем..."
	docker compose down

.PHONY: logs
logs:
	docker compose logs -f

.PHONY: shell-one
shell-one:
	docker compose exec web_server_one /bin/bash

.PHONY: shell-two
shell-two:
	docker compose exec web_server_two /bin/bash

# -----------------------------------------------------------------------------
# Production (no override)
# -----------------------------------------------------------------------------

.PHONY: prod
prod:
	@echo "🏭 Запускаем в режиме PROD (daemon mode)..."
	docker compose -f docker-compose.yaml up --build -d

.PHONY: ci-build-prod
ci-build-prod:
	@echo "🤖 CI: build docker images"
	docker compose -f docker-compose.yaml build

.PHONY: prod-logs
prod-logs:
	docker compose -f docker-compose.yaml logs -f

.PHONY: prod-down
prod-down:
	@echo "🛑 Останавливаем PROD..."
	docker compose -f docker-compose.yaml down

# -----------------------------------------------------------------------------
# Utilities
# -----------------------------------------------------------------------------

.PHONY: clean
clean:
	@echo "🧹 Очистка Docker ресурсов..."
	docker compose down -v --rmi local
	docker system prune -f

.PHONY: rebuild
rebuild:
	@echo "🔄 Пересборка без кэша..."
	docker compose build --no-cache

.PHONY: status
status:
	docker compose ps