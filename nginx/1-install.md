# INSTALL

Instalando o NGINX para o teste.

**`ngx_http_limit_req_module`** que permite controlar o número de requisições que o servidor pode processar por segundo de uma maneira bem eficiente.

Aqui está um passo a passo para instalar o NGINX e configurá-lo para limitar a 70 requisições por segundo:

### 1. **Instalar o NGINX**

Se você estiver utilizando uma distribuição baseada em Debian (como Ubuntu), pode instalar o NGINX usando os seguintes comandos:

```bash
sudo apt update
sudo apt install nginx
```

Se você estiver usando uma distribuição baseada em Red Hat (como CentOS ou Fedora), use:

```bash
sudo yum install nginx
```