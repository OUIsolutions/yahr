
FROM alpine:latest

RUN apk update
RUN apk add --no-cache gcc musl-dev curl
# Copie os scripts necessários
#run Cmd with the following command
RUN  curl -L https://github.com/OUIsolutions/Darwin/releases/download/0.015/darwin.out -o /usr/local/bin/darwin
RUN chmod +x /usr/local/bin/darwin
CMD ["sh"]