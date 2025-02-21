# Configurando o Limit

Configuração para Limitar as Requisições

Abra o arquivo de configuração do NGINX:

```bash
sudo vi /etc/nginx/nginx.conf
```

Dentro do bloco `http { ... }`, você pode configurar a limitação de requisições. A configuração básica para limitar a 70 requisições por segundo seria a seguinte:

```nginx
worker_processes 1;

events {
    worker_connections 1024;
}

http {
    # Define o limite de requisições por segundo
    limit_req_zone $binary_remote_addr zone=req_limit_per_ip:10m rate=70r/s;

    server {
        listen 80;

        server_name localhost;

        location / {
            # Aplica o limite de requisições
            limit_req zone=req_limit_per_ip burst=70 nodelay;

            # Suas configurações de servidor aqui
            root /var/www/html;
            index index.html;
            
            # Outras configurações de local
            try_files $uri $uri/ =404;
        }
    }
}
```
