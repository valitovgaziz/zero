FROM golang:latest

WORKDIR /app

COPY . .

RUN go get github.com/pressly/goose/cmd/goose

RUN go install github.com/pressly/goose/v3/cmd/goose@latest

CMD ["goose", "up"]