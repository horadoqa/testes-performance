# Configuração de Limitação de Requisições no NGINX

Este guia descreve como configurar o NGINX para limitar o número de requisições por segundo a partir de um único endereço IP. Isso é útil para prevenir abusos, proteger o servidor contra ataques de negação de serviço (DoS) e melhorar o desempenho.

### 1. Abrir o arquivo de configuração do NGINX

Primeiro, abra o arquivo de configuração principal do NGINX usando o editor de texto `vi`:

```bash
sudo vi /etc/nginx/nginx.conf
```

### 2. Configurar a Limitação de Requisições

Dentro do bloco `http { ... }`, adicione ou modifique a configuração para definir o limite de requisições. Abaixo está a configuração básica para limitar o número de requisições a **70 por segundo** por IP:

```nginx
worker_processes 1;

events {
    worker_connections 1024;
}

http {
    # Definir a zona de limitação de requisições (70 requisições por segundo por IP)
    limit_req_zone $binary_remote_addr zone=req_limit_per_ip:10m rate=70r/s;

    server {
        listen 80;

        server_name localhost;

        location / {
            # Aplica a limitação de requisições para este local
            limit_req zone=req_limit_per_ip burst=70 nodelay;

            # Defina a raiz do servidor e o arquivo index
            root /var/www/html;
            index index.html;

            # Outras configurações do local
            try_files $uri $uri/ =404;
        }
    }
}
```

- **`limit_req_zone`**: Define a zona de limitação, onde `$binary_remote_addr` é o endereço IP do cliente. A zona é chamada de `req_limit_per_ip` e tem o tamanho de 10 MB. O limite é de **70 requisições por segundo** (`rate=70r/s`).
- **`limit_req`**: Aplica a limitação de requisições no local especificado. A diretiva `burst=70` permite um estouro de até 70 requisições, enquanto a opção `nodelay` impede que as requisições dentro desse estouro sejam atrasadas.

### 3. Testar e Aplicar as Configurações

Após fazer as alterações, é recomendável testar a configuração do NGINX para verificar se não há erros de sintaxe:

```bash
sudo nginx -t
```

Se o teste for bem-sucedido, recarregue o NGINX para aplicar as novas configurações:

```bash
sudo systemctl reload nginx
```

### 4. Verificação

Após a configuração, você pode monitorar o comportamento do servidor. Se um único IP ultrapassar o limite de 70 requisições por segundo, o NGINX começará a rejeitar novas requisições com o código de status HTTP **503 Service Unavailable**.

