
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

![Alerta - Slack](imgs/alert-slack.png)

![Alerta - Email](imgs/alertmanager-email.png)

![Alerta - Web](imgs/alertmanager-web.png)



