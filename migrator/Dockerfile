FROM golang:1.22.5

RUN apt-get update && apt-get install -y git

WORKDIR /app

COPY . .

RUN go install github.com/pressly/goose/v3/cmd/goose@latest

ENTRYPOINT [ "goose -dir=/app/migrations user=${DB_USER} dbname=${DB_NAME} sslmode=${SSLmode} up" ]