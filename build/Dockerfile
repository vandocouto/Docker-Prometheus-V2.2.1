FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl zip unzip iputils-ping telnet net-tools && \
    mkdir /var/run/sshd && \
    rm -rf /var/lib/apt/lists/*

ENV VERSION ${VERSION:-2.2.1}

RUN useradd --no-create-home --shell /bin/false prometheus && \
    useradd --no-create-home --shell /bin/false node_exporter && \
    mkdir /etc/prometheus && \
    mkdir /var/lib/prometheus && \
    chown prometheus:prometheus /etc/prometheus && \
    chown prometheus:prometheus /var/lib/prometheus && \
    echo ${VERSION} && \
    curl -LO https://github.com/prometheus/prometheus/releases/download/v${VERSION}/prometheus-${VERSION}.linux-amd64.tar.gz && \
    sha256sum prometheus-${VERSION}.linux-amd64.tar.gz && \
    tar -xvf prometheus-${VERSION}.linux-amd64.tar.gz && \
    cp prometheus-${VERSION}.linux-amd64/prometheus /usr/local/bin/ && \
    cp prometheus-${VERSION}.linux-amd64/promtool /usr/local/bin/ && \
    chown prometheus:prometheus /usr/local/bin/prometheus && \
    chown prometheus:prometheus /usr/local/bin/promtool && \
    cp -r prometheus-${VERSION}.linux-amd64/consoles /etc/prometheus && \
    cp -r prometheus-${VERSION}.linux-amd64/console_libraries /etc/prometheus && \
    chown -R prometheus:prometheus /etc/prometheus/consoles & \
    chown -R prometheus:prometheus /etc/prometheus/console_libraries && \
    rm -rf prometheus-${VERSION}.linux-amd64.tar.gz prometheus-${VERSION}.linux-amd64