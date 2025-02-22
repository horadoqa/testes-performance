# Instalação

## Atualizar os pacotes

```bash
sudo apt update
```

## Instalar o Node Exporter

```bash
sudo apt install prometheus-node-exporter
```

## Verificar se o serviço está em execução

```bash
sudo systemctl status prometheus-node-exporter
```

## Inicializar serviço, caso não esteja em execução

```bash
sudo systemctl start prometheus-node-exporter
```

## Habilitar o serviço para que inicialize junto com o sistema

```bash
sudo systemctl enable prometheus-node-exporter
```

## Verificar se o Node Exporter está funcionando

http://<IP>:9100/metrics
