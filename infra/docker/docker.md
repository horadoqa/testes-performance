# Docker

## Executando localmente

```bash
docker run -i --rm grafana/k6 run - < script.js
```
## Com saída para o InfluxDB:

```bash
K6_OUT=influxdb_v2=http://<EC2-IP>:8086?org=horadoqa&bucket=k6&token=meu-token-superseguro docker run -i --rm grafana/k6 run - < script.js
```

na instância do k6
K6_OUT=influxdb=http://admin:admin@52.90.59.216:8086/k6 k6 run login.js