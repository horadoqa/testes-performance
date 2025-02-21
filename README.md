# Testes de Performance

Este projeto tem como objetivo fornecer uma compreensão aprofundada dos **testes de performance** e suas diversas abordagens, abordando os diferentes tipos de testes usados para avaliar o comportamento e a robustez de sistemas e aplicações sob diferentes condições de carga.

## Objetivo do Projeto

O principal objetivo deste projeto é apresentar e documentar os **testes de performance** mais comuns utilizados para garantir que sistemas e aplicações suportem o tráfego esperado e identifiquem falhas que podem ocorrer sob diferentes tipos de carga. O projeto cobre os seguintes tipos de testes:

1. **Testes de Carga (Load Testing)**: Avaliar o comportamento do sistema sob uma carga esperada de usuários ou transações simultâneas.
2. **Testes de Stress (Stress Testing)**: Identificar o ponto de falha do sistema, simulando condições extremas e além da capacidade máxima do sistema.
3. **Testes de Picos (Spike Testing)**: Avaliar a resposta do sistema a picos súbitos e inesperados de tráfego.
4. **Testes de Robustez (Endurance Testing)**: Testar a capacidade do sistema de manter um desempenho estável ao longo de um período prolongado.
5. **Testes de Escalabilidade (Scalability Testing)**: Avaliar a capacidade do sistema de crescer e lidar com aumentos na carga de trabalho, seja horizontal (adicionando mais servidores) ou vertical (aumentando recursos de hardware).
6. **Testes de Volume (Volume Testing)**: Analisar o comportamento do sistema ao processar grandes volumes de dados.

## Estrutura do Projeto

Este projeto está estruturado em várias seções que cobrem os diferentes tipos de testes de performance, exemplos práticos e como configurar ferramentas de teste, como o **k6**, para realizar esses testes.

### Seções Principais

- **Introdução aos Testes de Performance**: Visão geral de como os testes de performance são conduzidos e sua importância para sistemas escaláveis.
- **Testes de Carga**: Como realizar testes de carga para verificar como o sistema se comporta sob uma carga esperada.
- **Testes de Stress**: Como identificar os limites de falha de um sistema, simulando cargas extremas.
- **Testes de Picos**: Avaliação da resposta do sistema a aumentos abruptos no tráfego.
- **Testes de Robustez**: Como avaliar o desempenho do sistema em um longo período de tempo, simulando tráfego contínuo.
- **Testes de Escalabilidade**: Como testar o sistema para verificar se ele pode escalar de acordo com a necessidade.
- **Testes de Volume**: Como testar a capacidade do sistema para processar grandes quantidades de dados.

## Ferramentas Utilizadas

Neste projeto, utilizamos as seguintes ferramentas para realizar os testes de performance:

- **k6**: Uma das ferramentas mais populares para realizar testes de carga e performance em sistemas. Ele permite simular grandes volumes de tráfego e gerar relatórios detalhados sobre a performance do sistema.

## Como Rodar os Exemplos

### Requisitos

Antes de começar, certifique-se de que você tem o **k6** instalado na sua máquina. Caso não tenha, você pode instalar o k6 seguindo as instruções disponíveis na [documentação oficial do k6](https://k6.io/docs/getting-started/).

### Passos para Rodar os Exemplos

1. Clone este repositório para o seu ambiente local:

   ```bash
   git clone https://github.com/horadoqa/testes-performance.git
   cd testes-performance
   ```

2. Navegue até o diretório de um teste específico, por exemplo:

   ```bash
   cd testes
   ```

3. Execute o teste utilizando o k6. Por exemplo, para executar um teste de carga:

   ```bash
   k6 run carga.js
   ```

   O k6 irá simular o número de usuários definidos no script e gerar um relatório de performance.

## Contribuições

Contribuições são bem-vindas! Se você deseja melhorar a documentação, corrigir um erro ou adicionar um novo tipo de teste, basta criar um **pull request**. Antes de começar a contribuir, por favor, leia nosso guia de **contribuição**.

## Licença

Este projeto é licenciado sob a [MIT License](LICENSE).

---

## Tópicos para Leitura

- **[Documentação do k6](https://k6.io/docs/)**: Documentação oficial da ferramenta usada para realizar os testes.
- **[Introdução aos Testes de Performance](https://www.guru99.com/performance-testing.html)**: Um ótimo artigo que fornece uma visão geral sobre testes de performance.
- **[Testes de Carga com k6](https://k6.io/docs/using-k6/)**: Guia sobre como usar o k6 para realizar testes de carga.