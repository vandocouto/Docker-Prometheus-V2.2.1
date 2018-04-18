FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl zip unzip iputils-ping telnet net-tools && \
    mkdir /var/run/sshd && \
    rm -rf /var/lib/apt/lists/*


ENV VERSION ${VERSION:-2.2.1}



RUN useradd --no-create-home --shell /bin/false prometheus
RUN useradd --no-create-home --shell /bin/false node_exporter

RUN mkdir /etc/prometheus
RUN mkdir /var/lib/prometheus

RUN chown prometheus:prometheus /etc/prometheus
RUN chown prometheus:prometheus /var/lib/prometheus
RUN echo ${VERSION}
RUN curl -LO https://github.com/prometheus/prometheus/releases/download/v${VERSION}/prometheus-${VERSION}.linux-amd64.tar.gz

RUN sha256sum prometheus-${VERSION}.linux-amd64.tar.gz

RUN tar -xvf prometheus-${VERSION}.linux-amd64.tar.gz

RUN cp prometheus-${VERSION}.linux-amd64/prometheus /usr/local/bin/
RUN cp prometheus-${VERSION}.linux-amd64/promtool /usr/local/bin/

RUN chown prometheus:prometheus /usr/local/bin/prometheus
RUN chown prometheus:prometheus /usr/local/bin/promtool

RUN cp -r prometheus-${VERSION}.linux-amd64/consoles /etc/prometheus
RUN cp -r prometheus-${VERSION}.linux-amd64/console_libraries /etc/prometheus

RUN chown -R prometheus:prometheus /etc/prometheus/consoles
RUN chown -R prometheus:prometheus /etc/prometheus/console_libraries

RUN rm -rf prometheus-${VERSION}.linux-amd64.tar.gz prometheus-${VERSION}.linux-amd64