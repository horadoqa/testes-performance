### 1. **Introdução ao k6 e Conceitos de Testes de Performance**

- **Objetivo:** Apresentar os testes de performance e a importância de sua aplicação no desenvolvimento de sistemas, destacando o k6 como uma ferramenta essencial para essa tarefa.
- **Conteúdo:**
  - O que são testes de performance, carga, stress e outros tipos relacionados.
  - Introdução ao **k6** como uma ferramenta moderna e eficiente para realizar testes de performance.
  - Comparação do **k6** com outras ferramentas populares, como JMeter, Gatling e Locust.

   **Link para vídeo:** [Introdução ao k6](#)

---

### O que são Testes de Performance?

Testes de performance são um conjunto de avaliações projetadas para medir o comportamento de um sistema (seja um site, aplicação ou serviço) sob diferentes condições de carga. O objetivo principal desses testes é garantir que o sistema consiga suportar o tráfego esperado sem falhas ou degradação significativa do desempenho.

Eles são essenciais para **identificar e corrigir** problemas de performance antes que esses afetem os usuários finais. Dessa forma, contribuem para melhorar a **confiabilidade**, **escalabilidade** e **experiência do usuário**.

### Principais Tipos de Testes de Performance

1. [**Testes de Stress (Stress Testing):**](./programa/4-stress.md) Testam o sistema além dos seus limites para identificar o ponto de falha.
2. [**Testes de Carga (Load Testing):**](./programa/5-carga.md) Avaliam o comportamento do sistema sob uma carga esperada de usuários simultâneos.
3. [**Testes de Picos (Spike Testing):**](./programa/6-picos.md) Simulam picos súbitos e inesperados de tráfego para verificar como o sistema responde.
4. [**Testes de Robustez (Endurance Testing):**](./programa/7-robustez.md) Avaliam o desempenho do sistema ao longo de períodos prolongados de carga contínua.
5. [**Testes de Escalabilidade (Scalability Testing):**](./programa/escalabilidade.md) Verificam se o sistema pode crescer adequadamente sob uma carga crescente.
6. [**Testes de Configuração (Configuration Testing):**](./programa/config.md) Avaliam o impacto de mudanças de configuração no desempenho do sistema.

Esses testes são cruciais para garantir que o sistema não apenas atenda à demanda inicial, mas também se mantenha estável e eficaz sob condições extremas ou mudanças inesperadas de carga.

---

### Ferramentas de Teste de Performance

Existem várias ferramentas que ajudam na realização de testes de performance. Algumas das mais conhecidas incluem:

- [**Apache Benchmarking**](https://httpd.apache.org/docs/2.4/programs/ab.html)
- [**WRK**](https://httpd.apache.org/docs/2.4/programs/ab.html)
- [**JMeter**](https://jmeter.apache.org/)
- [**Locust**](https://locust.io/)
- [**K6**](https://grafana.com/oss/k6/)
- [**Vegeta**](https://github.com/tsenart/vegeta)

Embora existam muitas opções no mercado, nesta série, vamos focar em **k6**, uma ferramenta moderna e poderosa para realizar testes de performance, especialmente adequada para desenvolvedores que buscam automatizar e integrar testes de carga em seus pipelines.