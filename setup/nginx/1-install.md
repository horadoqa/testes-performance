# INSTRUÇÕES DE INSTALAÇÃO

Este guia ensina como instalar o NGINX em diferentes sistemas operacionais e configurá-lo para limitar as requisições a **70 por segundo**. Siga os passos de acordo com o sistema que você está utilizando.

## 1. **Instalar o NGINX**

### Para Distribuições Baseadas em Debian (como Ubuntu)

Se você estiver utilizando uma distribuição baseada em Debian (como Ubuntu), siga os passos abaixo:

1. Atualize o índice de pacotes do sistema:

   ```bash
   sudo apt update
   ```

2. Instale o NGINX:

   ```bash
   sudo apt install nginx
   ```

3. Inicialize o NGINX

   ```bash
   sudo systemctl start nginx
   ```

### Para Distribuições Baseadas em Red Hat (como CentOS ou Fedora)

Se você estiver utilizando uma distribuição baseada em Red Hat (como CentOS ou Fedora), use os seguintes comandos:

1. Instale o NGINX:

   ```bash
   sudo yum install nginx
   ```

   Ou, se estiver usando Fedora (versões mais recentes), utilize o `dnf`:

   ```bash
   sudo dnf install nginx
   ```

### Para macOS

No macOS, você pode usar o Homebrew, um gerenciador de pacotes para instalar o NGINX:

1. Se você ainda não tem o Homebrew instalado, instale-o com o seguinte comando:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Instale o NGINX com o Homebrew:

   ```bash
   brew install nginx
   ```

3. Inicie o NGINX:

   ```bash
   sudo nginx
   ```

4. O NGINX estará disponível em `http://localhost:8080` por padrão. Você pode modificar o arquivo de configuração se precisar ajustar a porta.

### Para Windows

No Windows, o processo de instalação do NGINX é um pouco diferente, pois ele não está disponível diretamente através de um gerenciador de pacotes como no Linux ou macOS. Siga os passos abaixo:

1. Baixe a versão do NGINX para Windows no site oficial: [NGINX para Windows](https://nginx.org/en/download.html).

2. Extraia o arquivo `.zip` baixado em um diretório de sua escolha (por exemplo, `C:\nginx`).

3. Navegue até a pasta onde o NGINX foi extraído e execute o arquivo `nginx.exe` para iniciar o servidor.

4. O NGINX estará disponível em `http://localhost` por padrão. Para parar o servidor, basta executar `nginx.exe -s stop` no terminal.