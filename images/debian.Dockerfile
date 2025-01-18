FROM debian:latest


RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    git \
    mingw-w64 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#run Cmd with the following command
RUN  curl -L https://github.com/OUIsolutions/Darwin/releases/download/0.015/darwin.out -o /usr/local/bin/darwin
RUN chmod +x /usr/local/bin/darwin
CMD ["sh"]