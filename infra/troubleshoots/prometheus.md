# Prometheus

## verificar o binário do Prometheus

```bash
which prometheus
```

## Verificar a versão do Prometheus

Se o binário estiver presente, você pode verificar a versão do Prometheus com o comando:

```bash
prometheus --version
```

## Verificar se o serviço do Prometheus está ativo (se estiver configurado como serviço systemd):

```bash
sudo systemctl status prometheus
```

Se a resposta for

```bash
Unit prometheus.service could not be found.
```


## Verificar se o processo do Prometheus está rodando:

Use o comando ps para procurar pelo processo do Prometheus:

```bash
ps aux | grep prometheus
ubuntu     16065  0.0  0.2   7080  2176 pts/0    S+   23:59   0:00 grep --color=auto prometheus
```
prometheus --config.file=/tmp/prometheus-2.45.0.linux-amd64/prometheus.yml

sudo ss -tuln | grep 9090

cd /usr/local/bin/prometheus




sudo mkdir -p /tmp/prometheus-2.45.0.linux-amd64/data

sudo chown -R ubuntu:ubuntu /tmp/prometheus-2.45.0.linux-amd64

nohup prometheus --config.file=/tmp/prometheus-2.45.0.linux-amd64/prometheus.yml --storage.tsdb.path=/tmp/prometheus-2.45.0.linux-amd64/data/ > /tmp/prometheus.log 2>&1 &
