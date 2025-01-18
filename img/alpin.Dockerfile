
FROM alpine:latest

RUN apk update
RUN apk add --no-cache gcc musl-dev
# Copie os scripts necessários
