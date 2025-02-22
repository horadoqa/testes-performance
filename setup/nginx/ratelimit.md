# Rate Limit

O **rate limit** (ou limite de taxa) é uma técnica usada para controlar o número de solicitações ou ações que um usuário ou sistema pode fazer em um determinado período de tempo. Essa prática é comum em sistemas online, APIs (interfaces de programação de aplicativos), servidores e plataformas para evitar abusos, sobrecarga ou uso excessivo de recursos.

### Como funciona:
Quando um serviço implementa rate limiting, ele impõe restrições sobre quantas vezes uma ação pode ser executada. Por exemplo:
- **API Rate Limit**: Uma API pode permitir que um usuário faça 100 requisições por minuto. Após atingir esse limite, o usuário precisará esperar até o próximo ciclo de tempo (geralmente um minuto) para poder fazer novas requisições.
- **Limites de login**: Para prevenir ataques de força bruta, um sistema pode permitir que uma pessoa tente se autenticar apenas 3 vezes em 10 minutos.
  
Esses limites podem ser implementados de várias maneiras, dependendo da necessidade do serviço e do tipo de interação, como:
1. **Limitação fixa**: Um número fixo de requisições permitidas em um intervalo de tempo (ex: 100 requisições por hora).
2. **Limitação escalonada**: Limites diferentes para diferentes tipos de usuários ou operações (ex: um usuário comum tem um limite menor que um usuário premium).
3. **Backoff exponencial**: O sistema pode permitir tentativas iniciais e, conforme o usuário excede o limite, ele deve esperar mais tempo para realizar novas tentativas.

### Exemplos de Rate Limiting:
- **Redes sociais**: Plataformas como Twitter ou Instagram podem limitar o número de publicações, seguidores ou ações que um usuário pode fazer em um intervalo de tempo.
- **APIs públicas**: Serviços como o Google Maps ou o Twitter possuem limites para as requisições feitas por desenvolvedores que integram suas APIs, para evitar sobrecarga.

### Por que usar?
1. **Prevenir abuso e ataques**: Como ataques DDoS (negação de serviço distribuída), onde sistemas são sobrecarregados com um grande volume de requisições.
2. **Garantir qualidade de serviço**: Evitar que um único usuário ou processo sobrecarregue o sistema, prejudicando a performance para outros.
3. **Gerenciamento de recursos**: Controlar o uso dos recursos de maneira eficiente, garantindo que todos os usuários tenham acesso igualitário.

Em resumo, o rate limit é uma forma de equilibrar o uso dos recursos, promovendo a estabilidade, segurança e a equidade no acesso aos serviços.