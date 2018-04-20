
FROM ubuntu:16.04
ENV PVERSION ${PVERSION:-2.2.1}

RUN apt-get update && apt-get install -y curl zip unzip iputils-ping telnet net-tools && \
    mkdir /var/run/sshd && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --no-create-home --shell /bin/false prometheus && \
    useradd --no-create-home --shell /bin/false node_exporter

RUN mkdir /etc/prometheus && \
    mkdir /var/lib/prometheus && \
    chown prometheus:prometheus /etc/prometheus && \
    chown prometheus:prometheus /var/lib/prometheus

RUN curl -LO https://github.com/prometheus/prometheus/releases/download/v${PVERSION}/prometheus-${PVERSION}.linux-amd64.tar.gz && \
    sha256sum prometheus-${PVERSION}.linux-amd64.tar.gz && \
    tar -xvf prometheus-${PVERSION}.linux-amd64.tar.gz && \ 
    rm -rf prometheus-${PVERSION}.linux-amd64.tar.gz 

RUN cp prometheus-${PVERSION}.linux-amd64/prometheus /usr/local/bin/ && \
    cp prometheus-${PVERSION}.linux-amd64/promtool /usr/local/bin/

RUN chown prometheus:prometheus /usr/local/bin/prometheus && \
    chown prometheus:prometheus /usr/local/bin/promtool 

COPY build-prometheus/alert.rules      /etc/prometheus/
COPY build-prometheus/prometheus.yml   /etc/prometheus/

RUN cp -r prometheus-${PVERSION}.linux-amd64/consoles /etc/prometheus && \
    cp -r prometheus-${PVERSION}.linux-amd64/console_libraries /etc/prometheus && \
    rm -rf prometheus-${PVERSION}.linux-amd64 && \
    mkdir /etc/prometheus/data/  && \
    chown -R prometheus:prometheus /etc/prometheus

