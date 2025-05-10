# Sites

## Grafana

```bash
curl -I http://<IP PUBLICO>:3000/login

HTTP/1.1 200 OK
Cache-Control: no-store
Content-Type: text/html; charset=UTF-8
X-Content-Type-Options: nosniff
X-Frame-Options: deny
X-Xss-Protection: 1; mode=block
Date: Fri, 09 May 2025 22:19:02 GMT
```


## InfluxDB

http://<IP PUBLICO do InfluxDB>:8086


## Serverest

http://54.91.224.135:3000

### LOGIN

```bash
curl -X 'POST' 'http://<IP PUBLICO do Serverest>:3000/login' -H 'accept: application/json' -H 'Content-Type: application/json' -d '{"email": "fulano@qa.com",  "password": "teste" }'
```


```bash
curl -I http://<IP PUBLICO do Serverest>:3000

HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
x-dns-prefetch-control: off
x-frame-options: SAMEORIGIN
strict-transport-security: max-age=15552000; includeSubDomains
x-download-options: noopen
x-content-type-options: nosniff
x-xss-protection: 1; mode=block
Content-Type: text/html; charset=utf-8
Content-Length: 3237
Date: Sun, 23 Feb 2025 22:00:37 GMT
Connection: keep-alive
Keep-Alive: timeout=5
```

## Influxd

http://<IP PUBLICO do K6>:8086

```bash
curl -I http://<IP PUBLICO do K6>:8086
```

## Prometheus

http://<IP PUBLICO K6>:9090/metrics

```bash
curl http://<IP PUBLICO K6>:9090/metrics
```

http://<IP PUBLICO SERVEREST>:9090/metrics

```bash
curl http://<IP PUBLICO SERVEREST>:9090/metrics
```

