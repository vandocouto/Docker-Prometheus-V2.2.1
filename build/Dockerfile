FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl zip unzip iputils-ping telnet net-tools && \
    mkdir /var/run/sshd && \
    rm -rf /var/lib/apt/lists/*

ENV PVERSION ${PVERSION:-2.2.1}
ENV AVERSION ${AVERSION:-0.15.0-rc.1}


RUN useradd --no-create-home --shell /bin/false prometheus && \
    useradd --no-create-home --shell /bin/false node_exporter && \
    mkdir /etc/prometheus && \
    mkdir /var/lib/prometheus && \
    chown prometheus:prometheus /etc/prometheus && \
    chown prometheus:prometheus /var/lib/prometheus && \
    echo ${VERSION} && \
    curl -LO https://github.com/prometheus/prometheus/releases/download/v${PVERSION}/prometheus-${PVERSION}.linux-amd64.tar.gz && \
    sha256sum prometheus-${PVERSION}.linux-amd64.tar.gz && \
    tar -xvf prometheus-${PVERSION}.linux-amd64.tar.gz && \
    curl -LO https://github.com/prometheus/alertmanager/releases/download/v${AVERSION}/alertmanager-${AVERSION}.linux-amd64.tar.gz && \
    tar -xvf alertmanager-${AVERSION}.linux-amd64.tar.gz && \
    cp prometheus-${VERSION}.linux-amd64/prometheus /usr/local/bin/ && \
    cp prometheus-${VERSION}.linux-amd64/promtool /usr/local/bin/ && \
    cp alertmanager-${AVERSION}.linux-amd64.tar.gz/alertmanager /usr/local/bin/ && \
    chown prometheus:prometheus /usr/local/bin/prometheus && \
    chown prometheus:prometheus /usr/local/bin/promtool && \
    chown prometheus:prometheus /usr/local/bin/alertmanager && \
    cp -r prometheus-${VERSION}.linux-amd64/consoles /etc/prometheus && \
    cp -r prometheus-${VERSION}.linux-amd64/console_libraries /etc/prometheus && \
    chown -R prometheus:prometheus /etc/prometheus/consoles & \
    chown -R prometheus:prometheus /etc/prometheus/console_libraries && \
    rm -rf prometheus-${VERSION}.linux-amd64.tar.gz prometheus-${VERSION}.linux-amd64 && \

    cp -rf