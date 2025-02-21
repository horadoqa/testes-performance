# Removendo o NGINX

Para remover o NGINX e todos os arquivos relacionados no seu sistema, você pode seguir os passos abaixo. Vou assumir que você está usando uma distribuição Linux baseada no Debian (como o Ubuntu) ou uma distribuição baseada no Red Hat. Dependendo da sua distribuição, os comandos podem variar um pouco.

### Em uma distribuição baseada no Debian/Ubuntu:

1. **Remover o pacote NGINX**:
   Primeiro, pare o serviço NGINX e remova o pacote NGINX:

   ```bash
   sudo systemctl stop nginx
   sudo systemctl disable nginx
   sudo apt-get purge nginx nginx-common nginx-full
   ```

2. **Remover arquivos de configuração e outros arquivos associados**:
   Depois de remover o pacote, você pode limpar os arquivos de configuração e os arquivos do cache que ainda permanecem:

   ```bash
   sudo apt-get autoremove --purge
   sudo apt-get clean
   sudo rm -rf /etc/nginx /var/log/nginx /var/www/html /var/cache/nginx
   ```

3. **Verificar se o NGINX foi completamente removido**:
   Para garantir que o NGINX foi totalmente removido, você pode usar o comando abaixo para verificar se ainda há arquivos ou pacotes relacionados:

   ```bash
   which nginx
   ```

   Se o comando não retornar nada, significa que o NGINX foi removido corretamente.

---

### Em uma distribuição baseada no Red Hat/CentOS/Fedora:

1. **Parar o serviço NGINX**:
   Primeiro, pare o serviço NGINX:

   ```bash
   sudo systemctl stop nginx
   sudo systemctl disable nginx
   ```

2. **Remover o pacote NGINX**:
   Agora remova o NGINX com o comando `yum` ou `dnf`, dependendo da sua distribuição:

   ```bash
   sudo yum remove nginx  # Para CentOS 7 ou versões mais antigas do Red Hat
   sudo dnf remove nginx  # Para Fedora ou CentOS 8+
   ```

3. **Remover arquivos de configuração e outros arquivos associados**:
   Para remover arquivos de configuração e cache do NGINX, execute:

   ```bash
   sudo rm -rf /etc/nginx /var/log/nginx /var/www/html /var/cache/nginx
   ```

4. **Verificar se o NGINX foi completamente removido**:
   Verifique novamente se o NGINX foi completamente removido com:

   ```bash
   which nginx
   ```

---

Após isso, o NGINX e seus arquivos associados devem estar removidos do seu sistema. 
