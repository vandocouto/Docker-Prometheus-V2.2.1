
```bash
docker build -f build-prometheus/Dockerfile -t prometheus:latest .
docker build -f build-alertmanager/Dockerfile -t alertmanager:latest .
```

```bash
docker volume create --name=prometheus
```

```bash
docker-compose up -d
```

### Gráficos

**Gráfico CPU LOAD**

![Alerta - Web](imgs/grafico-load1.png)

### Alertas

**Alerta recebido no canal General do Slack**

![Alerta - Slack](imgs/alert-slack.png)

**Alerta recebido no email (Relay configurado para o prometheus)**

![Alerta - Email](imgs/alertmanager-email.png)

**Alerta recebido no http://alertmanager:9093**

![Alerta - Web](imgs/alertmanager-web.png)

**Gráfico CPU LOAD**

![Alerta - Web](imgs/grafico-load1.png)




