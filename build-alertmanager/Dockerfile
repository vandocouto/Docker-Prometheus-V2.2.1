FROM ubuntu:16.04
ENV AVERSION ${AVERSION:-0.15.0-rc.1}

RUN apt-get update && apt-get install -y curl zip unzip iputils-ping telnet net-tools && \
    mkdir /var/run/sshd && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --no-create-home --shell /bin/false prometheus && \
    useradd --no-create-home --shell /bin/false node_exporter

RUN mkdir /etc/prometheus && \
    mkdir /var/lib/prometheus && \
    chown prometheus:prometheus /etc/prometheus && \
    chown prometheus:prometheus /var/lib/prometheus

RUN curl -LO https://github.com/prometheus/alertmanager/releases/download/v${AVERSION}/alertmanager-${AVERSION}.linux-amd64.tar.gz && \
    tar -xvf alertmanager-${AVERSION}.linux-amd64.tar.gz && \
    rm -rf alertmanager-${AVERSION}.linux-amd64.tar.gz && \
    cp alertmanager-${AVERSION}.linux-amd64/alertmanager /usr/local/bin/ && \
    cp -r alertmanager-${AVERSION}.linux-amd64/alertmanager /etc/prometheus && \
    chown prometheus:prometheus /usr/local/bin/alertmanager && \
    chown prometheus:prometheus /etc/prometheus && \
    rm -rf alertmanager-${AVERSION}.linux-amd64

COPY build-alertmanager/alertmanager.yml 	/etc/prometheus/
COPY build-alertmanager/run.sh			/etc/prometheus/
