# SLEEP

No k6, ferramenta de teste de carga e desempenho, o comando sleep é utilizado para fazer com que o script de teste "pause" a execução por um tempo determinado. Ele é útil para simular o comportamento real de usuários, que geralmente não realizam ações de forma contínua e sem pausas. A ideia é emular a interação mais natural de um usuário, incluindo tempos de espera entre ações, como o tempo para digitar, ler uma página ou esperar uma resposta do servidor.

Pausar por 2 segundos:

```Javascript
sleep(2);
```

Pausar por um tempo aleatório entre 1 e 5 segundos:

```Javascript
sleep(Math.random() * (5 - 1) + 1);
```

## Importância do sleep em testes de carga

- Simulação de usuários reais: Durante um teste de carga, o sleep é essencial para simular interações mais naturais e reduzir a intensidade do tráfego no servidor.
- Espaçamento entre requisições: Ele pode ser usado para garantir que as requisições não sejam enviadas em excesso, permitindo que o sistema sob teste tenha tempo para processar as respostas adequadamente.

Ao usar o sleep no k6, você pode controlar de forma mais precisa como os usuários virtuais (VUs - Virtual Users) se comportam durante o teste.