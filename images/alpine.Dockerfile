
FROM alpine:latest

RUN apk update
RUN apk add --no-cache gcc musl-dev
# Copie os scripts necessários
RUN curl -L https://github.com/OUIsolutions/Darwin/releases/download/0.015/darwin.out -o /usr/local/bin/darwin