FROM python:3.12-slim

# uv 설치를 위한 curl, unzip 등 준비
RUN apt-get update && apt-get install -y curl unzip \
  && rm -rf /var/lib/apt/lists/*

RUN curl -Ls https://astral.sh/uv/install.sh | bash

ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /app

RUN uv venv

ENV VIRTUAL_ENV=/app/.venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY pyproject.toml .
COPY uv.lock .
RUN uv pip install -r uv.lock

COPY . .

EXPOSE 8000

CMD ["gunicorn", "config.wsgi:application", "-b", "0.0.0.0:8000"]
