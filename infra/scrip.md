Para garantir que o serviço do **Serverest** esteja sempre rodando e, caso caia, reinicie automaticamente, além de registrar os reinícios no arquivo de log, podemos criar um script que seja executado em segundo plano e que periodicamente verifique se o processo do Serverest está ativo.

Aqui está uma versão do script que você pode utilizar no Ubuntu para realizar essa tarefa. Ele também registra cada reinício no arquivo `service.log` com a data e hora.

### Passos para Implementação:
1. Criar um script bash que verifica se o processo do Serverest está rodando.
2. Caso o processo não esteja rodando, o script reinicia a aplicação e registra o evento no `service.log`.
3. Garantir que o script seja executado em segundo plano para rodar continuamente.

### Script bash (verificar_serverest.sh)

```bash
#!/bin/bash

# Caminho para o arquivo de log
LOG_FILE="/var/log/service.log"

# Caminho do arquivo que você executa o Serverest
SERVEREST_CMD="node /usr/local/lib/node_modules/serverest/src/server.js"

# Função para verificar se o Serverest está rodando
check_serverest() {
    # Verifica se o processo do Serverest está rodando
    if ! pgrep -f "$SERVEREST_CMD" > /dev/null 2>&1; then
        echo "$(date) - Serverest não encontrado. Reiniciando..." >> $LOG_FILE
        restart_serverest
    else
        echo "$(date) - Serverest está rodando." >> $LOG_FILE
    fi
}

# Função para reiniciar o Serverest
restart_serverest() {
    # Iniciar o Serverest em background (executando de forma assíncrona)
    nohup $SERVEREST_CMD > /dev/null 2>&1 &

    # Log do reinício
    echo "$(date) - Serverest foi reiniciado." >> $LOG_FILE
}

# Laço infinito que verifica o estado do Serverest a cada 10 segundos
while true; do
    check_serverest
    sleep 10  # A cada 10 segundos
done
```

### Passos para executar o script:

1. **Salvar o script**: Crie um arquivo chamado `verificar_serverest.sh` no servidor.
    ```bash
    nano /path/to/verificar_serverest.sh
    ```
    Cole o conteúdo do script acima e salve o arquivo.

2. **Permissões de execução**:
    Torne o script executável:
    ```bash
    chmod +x /path/to/verificar_serverest.sh
    ```

3. **Rodar o script em segundo plano**:
    Você pode rodar o script em segundo plano com o comando `nohup` (para que continue rodando após a sessão ser encerrada):
    ```bash
    nohup /path/to/verificar_serverest.sh &
    ```

4. **Verificar o arquivo de log**:
    O arquivo de log será gerado em `/var/log/service.log`. Para visualizar os logs, você pode usar o comando:
    ```bash
    tail -f /var/log/service.log
    ```

### Criando um serviço `systemd` (opcional):
Se você deseja garantir que o script seja executado automaticamente após o reboot, você pode criar um serviço `systemd` para gerenciar a execução.

1. **Criar o arquivo de unidade do systemd**:
    Crie um arquivo de serviço, por exemplo, `verificar_serverest.service`:
    ```bash
    sudo nano /etc/systemd/system/verificar_serverest.service
    ```

    Adicione o seguinte conteúdo ao arquivo:

    ```ini
    [Unit]
    Description=Verificar Serverest e reiniciar se necessário
    After=network.target

    [Service]
    ExecStart=/path/to/verificar_serverest.sh
    Restart=always
    User=root

    [Install]
    WantedBy=multi-user.target
    ```

2. **Habilitar e iniciar o serviço**:
    Agora você pode habilitar e iniciar o serviço com os comandos:

    ```bash
    sudo systemctl daemon-reload
    sudo systemctl enable verificar_serverest.service
    sudo systemctl start verificar_serverest.service
    ```

### Explicação:
- O script verifica a cada 10 segundos se o processo `serverest` está rodando. Caso não esteja, ele é reiniciado.
- Cada vez que o script reinicia o Serverest, ele registra a data e hora no arquivo `service.log`.
- Se você configurar o serviço `systemd`, ele será automaticamente iniciado após o reboot e garantirá que o script continue a rodar em segundo plano.

Com isso, você terá um monitoramento contínuo para o serviço Serverest, garantindo que ele esteja sempre em funcionamento.