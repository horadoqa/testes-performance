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
