### 6. **Testes de Configuração (Configuration Testing):**
   - **Objetivo:** Avaliar como o sistema responde a mudanças em sua configuração, como ajustes em hardware, software ou rede.
   - **Exemplo:** Testar a performance de um aplicativo após a atualização de sua base de dados ou mudança de servidores.

## **Estágios**

Estes são os estágios com base no comportamento da carga que está sendo simulada em cada fase.

Os nomes ajudam a entender o que está acontecendo em cada estágio e são comuns em testes de performance, onde buscamos simular cenários realistas de uso crescente e diminuindo a carga para avaliar a resistência do sistema.

---

### **1. "Ramp-up Inicial"**
   - **Duração:** 60 segundos  
   - **Usuários:** 70  
   - **Descrição:** Neste estágio, a carga começa a ser aumentada gradualmente até atingir 70 usuários simulados. Este cenário pode ser usado para representar o aquecimento da aplicação, onde a carga começa de forma controlada e progressiva.

---

### **2. "Carga Estável Inicial"**
   - **Duração:** 4 minutos  
   - **Usuários:** 70
   - **Descrição:** Aqui, a carga permanece constante com 70 usuários durante um período mais prolongado, permitindo avaliar a performance do sistema sob uma carga contínua e estável. Esse estágio é crucial para verificar a capacidade de sustentação da aplicação com um número fixo de usuários.

---

### **3. "Ramp-down"**
   - **Duração:** 30 segundos  
   - **Usuários:** 0  
   - **Descrição:** Neste estágio, a carga é gradualmente reduzida para 0 usuários, simulando a finalização do teste ou a diminuição do tráfego. Este processo é importante para observar como o sistema reage à remoção do tráfego intenso, incluindo a recuperação de recursos ou sistemas de cache.

---

### **Resumo dos Estágios:**

1. **Ramp-up Inicial**: Aumento gradual da carga para 70 usuários em 60 segundos.
2. **Carga Estável Inicial**: Manutenção de 70 usuários por 4 minutos (carga estável).
3. **Ramp-down**: Redução gradual da carga para 0 usuários em 30 segundos (finalização ou redução do teste).

