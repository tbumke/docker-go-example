# syntax=docker/dockerfile:1

FROM golang:1.24-alpine

WORKDIR /app

COPY *.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /docker-go-example

EXPOSE 8080

CMD [ "/docker-go-example" ]
