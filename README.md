
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
