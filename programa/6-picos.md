## 6. **Testes de Picos: Avaliando a Performance Durante Picos de Tráfego**

- **Objetivo:** O principal objetivo dos testes de picos é avaliar como o sistema responde a aumentos repentinos e inesperados de tráfego. Esse tipo de teste simula cenários em que o número de usuários acessando a aplicação aumenta abruptamente, como durante promoções inesperadas ou eventos de alta visibilidade, e tem como foco a capacidade de o sistema lidar com essa carga inesperada sem falhas ou degradação de performance.

- **Conteúdo:**
  - Definição dos testes de picos e a sua importância para a estabilidade e performance do sistema.
  - Como configurar o **k6** para gerar tráfego intenso de forma repentina, simulando condições de pico.
  - Como interpretar os resultados, focando na identificação de picos de latência, falhas no sistema e possíveis gargalos de desempenho.

- **Exemplo:** Um exemplo clássico de teste de pico seria simular uma grande quantidade de usuários acessando simultaneamente uma página de produto durante uma promoção inesperada. Esse tipo de tráfego súbito pode causar sobrecarga, e o teste ajuda a verificar como o sistema reage a essas situações.

---

## **Estágios do Teste de Picos**

Os testes de picos são compostos por diferentes estágios, que representam fases distintas do comportamento do tráfego. Cada estágio ajuda a simular o impacto de picos repentinos e subsequentes processos de recuperação do sistema após o evento.

---

### **1. Ramp-up Inicial**  
   - **Duração:** 60 segundos  
   - **Usuários:** 20  
   - **Descrição:** Neste estágio, a carga começa de forma gradual, com a simulação de 20 usuários. O objetivo é aquecer o sistema de forma controlada, permitindo que ele se prepare para o aumento subsequente de tráfego. Este estágio permite avaliar como o sistema responde a uma carga inicial leve antes de ser submetido a um aumento significativo.

---

### **2. Carga Estável Inicial**  
   - **Duração:** 1 minuto e 30 segundos  
   - **Usuários:** 20  
   - **Descrição:** Após o ramp-up, o número de usuários se mantém constante em 20, simulando um tráfego estável e moderado. Esse estágio é importante para monitorar a estabilidade do sistema sob carga moderada antes de submeter a aplicação a um pico de tráfego. Ele permite avaliar o comportamento do sistema sob uma carga sustentada e contínua.

---

### **3. Pico de Carga**  
   - **Duração:** 30 segundos  
   - **Usuários:** 200  
   - **Descrição:** Neste estágio, o número de usuários é abruptamente elevado para 200, simulando um pico inesperado de tráfego. Este é o estágio de maior estresse, testando como o sistema responde a uma carga súbita e intensa em um curto espaço de tempo. A performance do sistema será avaliada em termos de tempo de resposta, latência e eventuais falhas ou degradação de performance.

---

### **4. Carga Estável Pós-Pico**  
   - **Duração:** 1 minuto e 30 segundos  
   - **Usuários:** 20  
   - **Descrição:** Após o pico de carga, a quantidade de usuários é reduzida de volta para 20, simulando a queda do tráfego para níveis mais baixos. Este estágio serve para observar como o sistema se comporta após o estresse do pico, verificando sua capacidade de retornar a um estado estável sem falhas, lentidão ou degradação de performance.

---

### **5. Ramp-down**  
   - **Duração:** 30 segundos  
   - **Usuários:** 0  
   - **Descrição:** O estágio final do teste consiste na redução gradual da carga até que não haja mais usuários simulados. Isso simula a queda do tráfego e permite observar como o sistema libera recursos, recupera caches e gerencia o encerramento do tráfego. A análise desse estágio se concentra na eficiência da recuperação do sistema e na liberação de recursos após o pico de carga.

---

### **Resumo dos Estágios de Teste:**

1. **Ramp-up Inicial:** Aumento gradual da carga até 20 usuários em 60 segundos.
2. **Carga Estável Inicial:** Manutenção de 20 usuários por 1m30s, simulando tráfego constante e moderado.
3. **Pico de Carga:** Aumento abrupto para 200 usuários por 30 segundos, simulando um pico intenso de tráfego.
4. **Carga Estável Pós-Pico:** Redução da carga para 20 usuários por 1m30s, permitindo observar a recuperação do sistema após o pico.
5. **Ramp-down:** Redução gradual da carga para 0 usuários em 30 segundos, simulando a diminuição do tráfego e a recuperação do sistema.

---

### **Interpretação dos Resultados:**

- **Durante o Ramp-up e Carga Estável Inicial:**  
  A primeira parte do teste serve para observar como o sistema se comporta com uma carga inicial e estável. Aqui, deve-se monitorar o tempo de resposta, taxas de erro e utilização de recursos. Não deve haver falhas ou degradação significativa no desempenho.

- **Durante o Pico de Carga:**  
  Este estágio é o ponto crítico do teste, onde o sistema é desafiado com um tráfego muito maior do que o esperado. O foco é identificar falhas de desempenho, como aumento significativo da latência, erros no sistema, quedas de serviço ou degradação acentuada no tempo de resposta. Um bom sistema deve conseguir lidar com esse pico sem falhas graves.

- **Durante a Carga Estável Pós-Pico e Ramp-down:**  
  Após o pico, o foco é observar a recuperação do sistema. O sistema deve ser capaz de retornar rapidamente a um estado estável, liberando recursos e restaurando o desempenho. A recuperação deve ser suave, sem falhas ou longos períodos de instabilidade. O teste também verifica a capacidade do sistema de gerenciar o retorno ao tráfego normal.

---

### **Links:**

- [**Link para o Script de Teste:**](../testes/picos.js)
- [**Link para o Gráfico de Resultados:**](../chart/3-picos.html)
- [**Link para Vídeo Tutorial:**](https://www.youtube.com/)
