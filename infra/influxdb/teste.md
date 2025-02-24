# Influxdb

## Alterar no arquivo influxdb.conf


## Verificar se está conectando

```bash
telnet <IP PUBLICO DO K6> 8086

Trying <IP PUBLICO DO K6>...
Connected to <IP PUBLICO DO K6>.
Escape character is '^]'.
```

## Verificar o Status

```bash
sudo systemctl status influxdb

● influxdb.service - InfluxDB is an open-source, distributed, time series database
     Loaded: loaded (/usr/lib/systemd/system/influxdb.service; enabled; preset: enabled)
     Active: active (running) since Mon 2025-02-24 14:11:33 UTC; 7min ago
       Docs: man:influxd(1)
   Main PID: 1068 (influxd)
      Tasks: 8 (limit: 1077)
     Memory: 8.2M (peak: 8.8M)
        CPU: 412ms
     CGroup: /system.slice/influxdb.service
             └─1068 /usr/bin/influxd -config /etc/influxdb/influxdb.conf

Feb 24 14:11:33 ip-172-31-34-240 influxd[1068]: ts=2025-02-24T14:11:33.753215Z lvl=info msg="Starting HTTP service" log_id=0uv4cdnW000 >
Feb 24 14:11:33 ip-172-31-34-240 influxd[1068]: ts=2025-02-24T14:11:33.753220Z lvl=info msg="opened HTTP access log" log_id=0uv4cdnW000>
Feb 24 14:11:33 ip-172-31-34-240 influxd[1068]: ts=2025-02-24T14:11:33.753612Z lvl=info msg="Listening on HTTP" log_id=0uv4cdnW000 serv>
Feb 24 14:11:33 ip-172-31-34-240 influxd[1068]: ts=2025-02-24T14:11:33.753640Z lvl=info msg="Starting retention policy enforcement serv>
Feb 24 14:11:33 ip-172-31-34-240 influxd[1068]: ts=2025-02-24T14:11:33.753937Z lvl=info msg="Storing statistics" log_id=0uv4cdnW000 ser>
Feb 24 14:11:33 ip-172-31-34-240 influxd[1068]: ts=2025-02-24T14:11:33.754157Z lvl=info msg="Listening for signals" log_id=0uv4cdnW000
Feb 24 14:16:34 ip-172-31-34-240 influxd[1068]: [httpd] 187.105.81.99 - - [24/Feb/2025:14:16:34 +0000] "GET /ping HTTP/1.1" 204 0 "-" ">
Feb 24 14:17:19 ip-172-31-34-240 influxd[1068]: [httpd] 187.105.81.99 - - [24/Feb/2025:14:17:19 +0000] "GET /ping HTTP/1.1" 204 0 "-" ">
lines 1-19
```

## Verificar se está LISTEN

```bash
sudo ss -tuln | grep 8086
tcp   LISTEN 0      4096                    *:8086            *:*
```

```bash
curl -i http://<IP PUBLICO DO K6>:8086/ping

HTTP/1.1 204 No Content
Content-Type: application/json
Request-Id: f398c8db-f2b9-11ef-8001-000000000000
X-Influxdb-Build: OSS
X-Influxdb-Version: 1.6.7~rc0
X-Request-Id: f398c8db-f2b9-11ef-8001-000000000000
Date: Mon, 24 Feb 2025 14:16:34 GMT
```

Criar o bando no INFLUXDB

Acessar a instância

```bash

sudo apt install influxdb-client

influx

CREATE DATABASE influxdb

exit
```

Verifique se o banco de dados contém dados:

```bash
influx
USE influxdb
SELECT * FROM nome_da_metrica LIMIT 10

SELECT "value" FROM "usage_cpu" WHERE $timeFilter

INSERT usage_cpu,host=server01 value=0.64

```


script.js

cat script.js

```bash
import http from 'k6/http';
import { check } from 'k6';

// URL da API para obter a lista de usuários
const url = 'http://34.203.229.87:3000/usuarios';

export const options = {
  stages: [
    { duration: '60s', target: 10 },
    { duration: '4m', target: 10 },
    { duration: '30s', target: 0 },
  ],
};

// Cabeçalhos da requisição
const headers = {
  'accept': 'application/json'
};

export default function () {
  // Envia a requisição GET
  let res = http.get(url, { headers: headers });

  // Verifica se o status da resposta é 200 (OK)
  check(res, {
    'status é 200': (r) => r.status === 200,
    'resposta contém um JSON': (r) => r.headers['Content-Type'] === 'application/json',
  });

  // Opcional: imprime a resposta para depuração
  // console.log('Resposta:', res.body);
}

```

## Executando

```bash
k6 run --out influxdb=http://18.209.101.187:8086/influxdb /tmp/script.js
