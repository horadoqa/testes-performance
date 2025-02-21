Aqui está uma versão melhorada da documentação:

---

### 3. **Criando o Primeiro Teste de Performance com k6**
- **Objetivo:** Orientar o usuário a criar o primeiro script simples de teste de performance usando o k6.
- **Conteúdo:**
  - Como escrever um script básico para testes de carga.
  - Configuração de um teste simples.
  - Execução do teste e análise dos resultados.

**Link para vídeo:** [Primeiro teste com k6](#)

---

Criar o seu primeiro teste de performance com o k6 é um ótimo ponto de partida para se familiarizar com a ferramenta. Vamos criar um teste básico de carga para medir o desempenho de um servidor web, simulando múltiplos usuários simultâneos.

### **Passo 1: Criando o arquivo de teste**

1. **Criação da pasta e do arquivo de teste**
   - Abra o **VSCode** ou qualquer editor de texto de sua preferência.
   - Crie uma nova pasta para armazenar os testes, chamada, por exemplo, `testes`.
   - Dentro dessa pasta, crie um arquivo chamado `carga.js`.

2. **Escrevendo o script**
   - Dentro do arquivo `carga.js`, cole o seguinte código:

   ```javascript
   import http from 'k6/http';
   import { check, sleep } from 'k6';

   export const options = {
     stages: [
       { duration: '60s', target: 70 },
       { duration: '4ms', target: 70 },
       { duration: '30s', target: 0 },
     ],
   };

   export default function () {
     const res = http.get('https://quickpizza.grafana.com/');
     check(res, { 'status was 200': (r) => r.status == 200 });
     sleep(1);
   }
   ```

### **Passo 2: Explicação do código**

- **Importação de módulos:**  
  O script utiliza o módulo `http` do k6 para realizar requisições HTTP e o módulo `check` para validar se a resposta do servidor é conforme o esperado (status 200).
  
- **Configuração `options`:**  
  O bloco `options` define a configuração do teste. O campo `stages` determina como a carga será escalonada:
  - A primeira fase mantém 70 usuários virtuais (VUs) durante 60 segundos.
  - A segunda fase mantém os 70 VUs por um tempo muito curto (4 milissegundos).
  - A última fase diminui a carga de usuários até 0 durante 30 segundos.

- **Função `default`:**  
  Cada "usuário virtual" executa a função padrão, que faz uma requisição HTTP GET para o site `https://quickpizza.grafana.com/` e verifica se o status de resposta é `200` (OK). Em seguida, o comando `sleep(1)` faz uma pausa de 1 segundo antes de repetir a ação.

---

### **Passo 3: Utilizando o `k6 new` para facilitar a criação de testes**

A partir da versão 0.49 do k6, você pode usar o comando `k6 new`, que facilita a criação de testes estruturados, com uma base de código pré-configurada.

#### **1. Certifique-se de ter a versão mais recente do k6**
Antes de utilizar o `k6 new`, verifique se você tem a versão 0.49 ou superior. Execute o seguinte comando:

```bash
k6 version
```

Se a versão for inferior a 0.49, atualize o k6 com o comando apropriado para o seu sistema:

- **No macOS/Linux (via Homebrew):**
  ```bash
  brew upgrade k6
  ```

- **No Windows (via Chocolatey):**
  ```bash
  choco upgrade k6
  ```

---

#### **2. Criando um novo teste com `k6 new`**

Com a versão atualizada do k6, execute o comando abaixo para criar um novo teste:

```bash
k6 new
```

- O k6 irá solicitar que você escolha um modelo de teste. O modelo padrão é adequado para a maioria dos testes de carga, mas você pode escolher um modelo mais específico, como **API** ou **web**.
- O k6 criará um diretório com o nome do seu projeto (ou algo como `test-project`) e, dentro dele, um arquivo de script de teste, geralmente chamado de `test.js`.

---

#### **3. Estrutura do arquivo gerado**

Ao executar `k6 new`, o k6 cria uma estrutura de diretórios básica como esta:

```bash
test
├── script.js
```

O arquivo `script.js` contém uma estrutura básica que você pode personalizar. Veja um exemplo do conteúdo gerado:

```javascript
import http from 'k6/http';
import { check } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 50 },
    { duration: '1m', target: 50 },
    { duration: '30s', target: 0 },
  ],
};

export default function () {
  let res = http.get('http://test.k6.io');
  check(res, {
    'status é 200': (r) => r.status === 200,
  });
}
```

Esse código segue a mesma estrutura do exemplo anterior, mas é mais enxuto. Ele também define uma carga com três estágios: aumento gradual do número de usuários, manutenção da carga, e redução final para zero.

---

### **Passo 4: Executando o Teste**

Agora que o arquivo de teste está pronto, basta rodá-lo com o comando:

```bash
k6 run script.js
```

Isso iniciará o teste conforme os parâmetros definidos no arquivo de script.

---

### **Passo 5: Personalizando o Teste**

Com o script gerado, você pode ajustá-lo conforme necessário:

- **Alterar a URL:** Modifique a URL no script para testar seu próprio serviço.
- **Adicionar diferentes tipos de requisição:** Você pode adicionar outras requisições como POST, PUT ou DELETE.
- **Ajustar as configurações de `stages`:** Modifique os parâmetros como a duração ou a quantidade de usuários para simular diferentes cenários.

---

### **Passo 6: Interpretando os Resultados**

Após a execução do teste, o k6 exibirá um relatório detalhado no terminal com várias métricas, como:

- **Número de requisições feitas.**
- **Taxa de sucesso (status 200).**
- **Tempo médio de resposta.**
- **Latência e outras métricas de desempenho.**
- **Taxa de erro.**

Com essas informações, você poderá avaliar a performance do sistema e identificar possíveis gargalos, como altas latências ou falhas de requisições.

---

### **Conclusão**

Este tutorial mostrou como criar um teste simples de carga com o k6, desde a escrita do código até a execução e interpretação dos resultados. A ferramenta k6 é poderosa e oferece muitas opções de personalização, como testar diferentes tipos de requisição, simular mais usuários, e muito mais.

Agora, com o básico dominado, você pode explorar cenários mais complexos e utilizar os testes de performance de forma eficaz para avaliar a escalabilidade e robustez de suas aplicações!



