### 10. **Integração do k6 em CI/CD**
   - **Objetivo:** Ensinar como integrar testes de performance em pipelines de CI/CD.
   - **Conteúdo:**
     - Como automatizar testes de performance usando o k6 com GitHub Actions, Jenkins ou GitLab CI.
     - Como garantir que os testes de performance sejam executados sempre que o código for alterado.
     - Dicas para integrar k6 em fluxos de trabalho de desenvolvimento ágil.

   **Link para vídeo:** [Integração com CI/CD](#)


```yaml
name: Continuos Integration
run-name: Executado por ${{ github.actor }} em ${{ github.run_number }}

on: 
  workflow_dispatch:
  push:
    branches:
      - main

jobs:
  run-test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup K6
        uses: grafana/setup-k6-action@v1
        
      - name: Run local k6 test
        uses: grafana/run-k6-action@v1
        with:
          path: testes/pizza.js
```