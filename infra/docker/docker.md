# Docker

## Executando localmente

```bash
docker run -i --rm grafana/k6 run - < script.js
```
## Com saída para o InfluxDB:

```bash
K6_OUT=influxdb_v2=http://<EC2-IP>:8086?org=horadoqa&bucket=k6&token=meu-token-superseguro \
docker run -i --rm grafana/k6 run - < script.js
```