ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION}-slim

# Отключает буферизацию stdout/stderr и не создает .pyc файлы
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Рабочая директория
WORKDIR /app

# Создаёт непривилегированного пользователя
# См. https://docs.docker.com/go/dockerfile-user-best-practices/
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

# Установка зависимостей с кэшированием
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python -m pip install -r requirements.txt

# Копирование исходного кода
COPY --chown=appuser:appuser . .

# Переключение на непривилегированного пользователя
USER appuser

# Порт и команда запуска передаются через ARG
ARG APP_PORT=8001
ARG APP_MODULE=app:app
ENV APP_PORT=${APP_PORT}
ENV APP_MODULE=${APP_MODULE}

EXPOSE ${APP_PORT}

CMD uvicorn ${APP_MODULE} --host=0.0.0.0 --port=${APP_PORT}
