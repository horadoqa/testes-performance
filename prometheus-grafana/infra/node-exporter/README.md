# Sobre o node-exporter

repositório: https://github.com/prometheus/node_exporter/releases

## Fazer o download

node_exporter-1.7.0.linux-amd64.tar.gz

## Copiar para o servidor

```bash
scp /mnt/c/Users/Fahham/Downloads/node_exporter-1.7.0.linux-amd64.tar.gz ec2-user@ec2-54-211-253-192.compute-1.amazonaws.com:~
```

## Descompactar

```bash
tar -xzf node_exporter-1.7.0.linux-amd64.tar.gz
```

## Acessar o diretório

```bash
cd node_exporter-1.7.0.linux-amd64
```

## executar o node-exporter

```bash
./node_exporter
```

## Acessar via borwser

http://<IP da instância>:9100/
