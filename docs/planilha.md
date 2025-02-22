# Planilha: Evidências dos Testes de Performance

| **ID do Teste** | **Tipo de Teste** | **Página Testada** | **Número de Usuários Simulados** | **Tempo Médio de Resposta (segundos)** | **Taxa de Erros (%)** | **Uso de CPU (%)** | **Uso de Memória (%)** | **Falhas/Problemas Encontrados** | **Soluções/Observações** | **Data do Teste** | **Responsável pelo Teste** |
|------------------|-------------------|-------------------|---------------------------------|---------------------------------------|-----------------------|---------------------|-------------------------|---------------------------------|--------------------------|------------------|---------------------------|
| 001              | Carga             | Página Inicial    | 100                             | 1.2                                   | 0.5%                  | 45%                 | 60%                     | Nenhuma falha                  | Sistema dentro da expectativa | 22/02/2025         | João Silva               |
| 002              | Carga             | Página de Produtos| 500                             | 1.5                                   | 0.7%                  | 55%                 | 70%                     | Nenhuma falha                  | Boa performance geral       | 22/02/2025         | João Silva               |
| 003              | Carga             | Página de Contato | 1000                            | 2.1                                   | 1.2%                  | 75%                 | 80%                     | Pequeno aumento no tempo de resposta | Considerar cacheamento de conteúdo | 22/02/2025         | João Silva               |
| 004              | Estresse          | Página Inicial    | 3000                            | 5.2                                   | 10%                   | 98%                 | 98%                     | Erros de carregamento, sistema instável | Aumento da infraestrutura recomendada | 22/02/2025         | João Silva               |
| 005              | Estresse          | Página de Produtos| 5000                            | 9.8                                   | 25%                   | 100%                | 100%                    | Sistema caiu após 4 minutos | Necessário ajustar balanceamento de carga | 22/02/2025         | João Silva               |
| 006              | Pico              | Página de Contato | 3000                            | 8.0                                   | 15%                   | 100%                | 90%                     | Falhas de login, sobrecarga de servidor | Avaliar escalabilidade automática | 22/02/2025         | João Silva               |
| 007              | Carga             | Página de Login   | 500                             | 1.3                                   | 0.3%                  | 48%                 | 65%                     | Nenhuma falha                  | Sistema funcionando bem     | 22/02/2025         | João Silva               |
| 008              | Pico              | Página Inicial    | 4000                            | 7.4                                   | 18%                   | 100%                | 95%                     | Lentidão no carregamento, sistema próximo ao limite | Considerar otimização de código | 22/02/2025         | João Silva               |

---

### Descrição das Colunas:
- **ID do Teste:** Identificador único para cada teste realizado.
- **Tipo de Teste:** Descrição do tipo de teste (Carga, Estresse, Pico).
- **Página Testada:** A página web que foi testada.
- **Número de Usuários Simulados:** Quantidade de usuários simultâneos simulados durante o teste.
- **Tempo Médio de Resposta (segundos):** Tempo médio que o servidor leva para responder à requisição.
- **Taxa de Erros (%):** Percentual de erros (ex: 500, 404) durante o teste.
- **Uso de CPU (%):** Percentual médio de uso de CPU do servidor durante o teste.
- **Uso de Memória (%):** Percentual médio de uso de memória do servidor durante o teste.
- **Falhas/Problemas Encontrados:** Relato de falhas ou problemas encontrados durante o teste, como lentidão, quedas de serviço, etc.
- **Soluções/Observações:** Sugestões ou observações para mitigar ou corrigir os problemas encontrados.
- **Data do Teste:** Data em que o teste foi realizado.
- **Responsável pelo Teste:** Nome do responsável pela execução do teste.

---

Esse modelo pode ser facilmente adaptado para diferentes testes e atualizado conforme necessário. Ele ajuda a manter um histórico organizado e facilita a análise de tendências e a tomada de decisões sobre otimizações e melhorias na página web.