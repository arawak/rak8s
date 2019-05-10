FROM docker:18

RUN apk add --no-cache \
    ansible \
    bash \
    curl \
    gettext \
    java-cacerts \
    jq \
    nodejs \
    python3 \
    ca-certificates \
    openssh-client \
    && \
    pip3 install docker-compose