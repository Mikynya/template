# 🐳 Docker Python Template

## 📁 Структура проекта

```
.
├── docker-compose.yaml          # Production конфигурация
├── docker-compose.override.yaml # Development конфигурация (hot-reload)
├── Makefile                     # Удобные команды
├── .env.example                 # Шаблон переменных окружения
├── bufferization/               # Сервис 1
│   ├── Dockerfile
│   ├── requirements.txt
│   └── buff.py
└── python-docker-example/       # Сервис 2
    ├── Dockerfile
    ├── requirements.txt
    └── app.py
```

## 🚀 Быстрый старт

```bash


# Только production зависимости
uv sync

# Все зависимости (production + dev)
uv sync --all-extras 

# Или альтернативный вариант
uv sync --dev

# Запустить в режиме разработки
make up

# Открыть в браузере
# http://localhost:8000 - web_server_one
# http://localhost:8001 - web_server_two
```

## 📋 Доступные команды

| Команда | Описание |
|---------|----------|
| `make up` | Запуск в режиме dev с hot-reload |
| `make up-d` | Запуск в dev режиме в фоне |
| `make down` | Остановка контейнеров |
| `make logs` | Просмотр логов |
| `make prod` | Запуск в production режиме |
| `make prod-logs` | Логи production |
| `make prod-down` | Остановка production |
| `make shell-one` | Shell в первый контейнер |
| `make shell-two` | Shell во второй контейнер |
| `make clean` | Полная очистка Docker ресурсов |
| `make rebuild` | Пересборка без кэша |
| `make status` | Статус контейнеров |

## 🔧 Конфигурация

Переменные окружения в `.env`:

| Переменная | По умолчанию | Описание |
|------------|--------------|----------|
| `PYTHON_VERSION` | 3.11 | Версия Python |
| `BUFFER_PORT` | 8000 | Порт первого сервиса |
| `APP_PORT` | 8001 | Порт второго сервиса |


## 📝 Добавление нового сервиса

1. Создать директорию с `Dockerfile`, `requirements.txt`, и основным файлом
2. Добавить сервис в `docker-compose.yaml` и `docker-compose.override.yaml`
3. Обновить `.env.example` с новыми переменными

## 📚 Полезные ссылки

- [Docker Compose Docs](https://docs.docker.com/compose/)
- [Awesome Compose Examples](https://github.com/docker/awesome-compose)
- [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
