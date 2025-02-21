# Testar a Configuração

Após realizar as alterações, você pode testar a configuração para garantir que não há erros de sintaxe:

```bash
sudo nginx -t
```

Se o teste for bem-sucedido, recarregue o NGINX para aplicar as alterações:

```bash
sudo systemctl reload nginx
```

## Testando com `curl`:

```bash
curl -I http://localhost
```

## Testando com `ab` (Apache Benchmark) para enviar uma carga alta de requisições:

```bash
ab -n 100 -c 10 http://localhost/
```

## Testando no Browser

Abra o borwser no seguinte endereço:

```bash
http://localhost/
```