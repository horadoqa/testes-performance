# Personalização do site

Para personalizar o conteúdo da página inicial do seu site, siga os passos abaixo:

### 1. Editar o arquivo `index.html`

Abra o arquivo `index.html` localizado no diretório padrão do NGINX com o editor de texto `vi`:

```bash
sudo vi /var/www/html/index.html
```

Faça as alterações desejadas no conteúdo HTML. Após editar, salve e saia do editor pressionando `:wq` (que significa "salvar e sair").

### 2. Recarregar o NGINX

Após modificar o arquivo, é necessário recarregar o NGINX para aplicar as alterações. Utilize o seguinte comando:

```bash
sudo systemctl reload nginx
```

Este comando irá recarregar o serviço sem interromper as conexões ativas.

### 3. Verificar as mudanças

Abra o navegador e acesse o site para verificar se as modificações foram aplicadas corretamente. Acesse o endereço:

```bash
http://localhost
```

Se você estiver acessando de uma máquina remota, substitua `localhost` pelo IP ou domínio do servidor.