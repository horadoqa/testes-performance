# Reajustar ou remover o Limite

## Reajustar as Diretivas de Rate Limiting

Dentro do arquivo de configuração, procure as diretivas que estão configurando a limitação de requisições, que podem ser semelhantes a estas:

```nginx
limit_req_zone $binary_remote_addr zone=one:10m rate=70r/s;
limit_req zone=one burst=10 nodelay;
```

Altere os valores:

```nginx
rate=70r/s;
burst=10
```

## Verifique a Configuração

Após realizar todas as alterações, sempre execute o comando para verificar a configuração do NGINX e garantir que não há erros de sintaxe:

```bash
sudo nginx -t
```

Se o teste de configuração for bem-sucedido, você poderá recarregar o NGINX com o comando:

```bash
sudo systemctl reload nginx
```

## Remover ou Comentar as Diretivas de Rate Limiting
Dentro do arquivo de configuração, procure as diretivas que estão configurando a limitação de requisições, que podem ser semelhantes a estas:

```nginx
# limit_req_zone $binary_remote_addr zone=one:10m rate=70r/s;
# limit_req zone=one burst=10 nodelay;
```

## Verifique a Configuração

Após realizar todas as alterações, sempre execute o comando para verificar a configuração do NGINX e garantir que não há erros de sintaxe:

```bash
sudo nginx -t
```

Se o teste de configuração for bem-sucedido, você poderá recarregar o NGINX com o comando:

```bash
sudo systemctl reload nginx
```