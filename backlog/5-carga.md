### 5. **Testes de Carga: Como Simular Usuários Simultâneos**

- **Objetivo:** Os testes de carga têm como principal objetivo avaliar o comportamento do sistema quando submetido a uma quantidade esperada de usuários ou transações simultâneas. Esses testes ajudam a verificar se o sistema é capaz de manter o desempenho esperado quando muitos usuários acessam o sistema ao mesmo tempo, sem causar degradação ou falhas.

- **Conteúdo:**
  - Definição de testes de carga e sua importância.
  - Como configurar corretamente o número de usuários simultâneos e a duração do teste.
  - Exemplos práticos utilizando os parâmetros `vus` (usuários virtuais) e `duration` (duração), configurando a quantidade de usuários simultâneos e o tempo de execução do teste.

- **Exemplo:** Um teste de carga típico poderia envolver a simulação de 70 usuários acessando simultaneamente uma página web. O objetivo seria observar como o sistema lida com esse volume de tráfego, mantendo o desempenho estável e sem falhas.

---

## **Estágios do Teste de Carga**

Os testes de carga são compostos por diferentes estágios que simulam o comportamento do sistema conforme a carga é aplicada e retirada. Esses estágios ajudam a analisar como o sistema reage à pressão, desde o início do teste até a sua finalização.

---

### **1. Ramp-up Inicial**
   - **Duração:** 60 segundos  
   - **Usuários:** 70  
   - **Descrição:** Este primeiro estágio simula um aumento gradual na carga, começando com um número reduzido de usuários e aumentando progressivamente até atingir 70. O objetivo é permitir que o sistema "aqueça" de maneira controlada, observando como ele reage à carga crescente sem sofrer impactos imediatos de sobrecarga. Este estágio simula o início da operação, onde o tráfego aumenta de forma controlada e progressiva.

---

### **2. Carga Estável Inicial**
   - **Duração:** 4 minutos  
   - **Usuários:** 70  
   - **Descrição:** Após o aumento gradual da carga, o número de usuários é mantido constante em 70 por 4 minutos. Este estágio é fundamental para avaliar a capacidade do sistema em sustentar uma carga constante e contínua ao longo do tempo, sem falhas ou degradação no desempenho. Durante esse período, observam-se métricas como tempo de resposta, taxa de erro e utilização de recursos do sistema.

---

### **3. Ramp-down (Desaceleração)**
   - **Duração:** 30 segundos  
   - **Usuários:** 0  
   - **Descrição:** O estágio final do teste simula a redução gradual do tráfego de usuários até que ele seja completamente eliminado. Isso permite observar como o sistema se comporta ao reduzir a carga, analisando a recuperação de recursos e a liberação de caches ou sessões de usuários. A principal análise nesse estágio é a capacidade do sistema de se estabilizar e liberar recursos adequadamente após o pico de carga.

---

### **Resumo dos Estágios de Teste:**

1. **Ramp-up Inicial:** Aumento gradual da carga de usuários, atingindo 70 usuários em 60 segundos.
2. **Carga Estável Inicial:** Manutenção de 70 usuários por 4 minutos para avaliar a estabilidade sob carga contínua.
3. **Ramp-down:** Redução gradual da carga para 0 usuários em 30 segundos, simulando a finalização do teste e a recuperação do sistema.

---

### **Interpretação dos Resultados:**

- **Durante o Ramp-up:**  
  Observe o comportamento do sistema à medida que a carga aumenta. Os primeiros sinais de falhas ou lentidão podem surgir neste estágio, especialmente se o sistema não for capaz de lidar com o aumento gradual de tráfego.

- **Durante a Carga Estável:**  
  O foco aqui é avaliar a capacidade do sistema de manter o desempenho estável sob carga constante. A análise deve ser feita considerando métricas como tempo de resposta, taxas de erro e consumo de recursos (CPU, memória, etc.). Se o sistema começar a apresentar falhas ou lentidão, isso pode indicar que ele não está otimizado para suportar a carga.

- **Durante o Ramp-down:**  
  Observe como o sistema se comporta quando a carga é removida gradualmente. Esse estágio testa a capacidade de recuperação do sistema, incluindo a liberação de recursos e o gerenciamento de cache. Uma recuperação rápida e sem falhas é um bom indicativo de que o sistema está bem otimizado para lidar com flutuações no tráfego.

---

### **Links:**

- [**Link para o Script de Teste:**](../testes/carga.js)
- [**Link para Gráfico de Resultados:**](../chart/2.carga.html)
- [**Link para Vídeo Tutorial:**](https://www.youtube.com/)

