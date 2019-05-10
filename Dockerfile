FROM docker:18

ADD .ssh /root/.ssh

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
    curl -L https://github.com/rancher/cli/releases/download/v2.0.4/rancher-linux-amd64-v2.0.4.tar.gz | tar xzf - && \
    curl -L https://storage.googleapis.com/kubernetes-helm/helm-v2.11.0-linux-amd64.tar.gz | tar xzf - && \
    curl -L https://github.com/rancher/rke/releases/download/v0.1.9/rke_linux-amd64 > /usr/local/bin/rke && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/v1.11.2/bin/linux/amd64/kubectl > /usr/local/bin/kubectl && \
    mv linux-amd64/helm rancher-v2.0.4/rancher /usr/local/bin/ && \
    rm -rf linux-amd64 rancher-v2.0.4 && \
    chmod +x \
    /usr/local/bin/helm \
    /usr/local/bin/kubectl \
    /usr/local/bin/rancher \
    /usr/local/bin/rke \
    && \
    pip3 install docker-compose && \
    chmod 700 /root/.ssh && \
    chmod 700 /root/.ssh/*
