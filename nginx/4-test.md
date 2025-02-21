# Testar a Configuração

Após realizar as alterações, você pode testar a configuração para garantir que não há erros de sintaxe:

```bash
sudo nginx -t
```

Se o teste for bem-sucedido, recarregue o NGINX para aplicar as alterações:

```bash
sudo systemctl reload nginx
```

---

## Monitorar o Comportamento

Agora, o NGINX está configurado para limitar as requisições a **70 por segundo por IP**. Quando um IP exceder esse limite, ele receberá uma resposta HTTP **`503 Service Unavailable`**.

Você pode testar essa limitação utilizando ferramentas como `curl`, `ab` (Apache Benchmark), ou qualquer outra ferramenta de carga para simular requisições em um curto espaço de tempo.

### Testando com `curl`:

```bash
curl -I http://localhost
```

### Testando com `ab` (Apache Benchmark) para enviar uma carga alta de requisições:

```bash
ab -n 100 -c 10 http://localhost/
```

---

