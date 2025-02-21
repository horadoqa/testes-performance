# Instalando o k6 no seu Ambiente

- **Objetivo:** Guiar o usuário na instalação do k6 em diferentes sistemas operacionais (Windows, macOS e Linux).
- **Conteúdo:**
  - Como instalar o k6 usando gerenciadores de pacotes como Homebrew (macOS), apt (Linux), ou diretamente pelo site oficial.
  - Como verificar a instalação do k6 no seu ambiente.

  **Link para vídeo:** [Instalação do k6](#)

---

O k6 é uma ferramenta de código aberto e multiplataforma, ideal para testes de performance. Sua instalação é simples e pode ser realizada de diversas formas, dependendo do sistema operacional que você está utilizando.

Aqui estão as instruções detalhadas para instalar o k6 em **Windows**, **macOS** e **Linux**.

---

### **1. Instalação no Windows**

Existem várias maneiras de instalar o k6 no Windows. As formas mais fáceis incluem o uso do **Chocolatey** ou **Windows Package Manager (winget)**. Também é possível realizar a instalação manualmente via executável.

#### **Via Chocolatey (Recomendado)**

1. Se você ainda não tem o **Chocolatey** instalado, abra o PowerShell como Administrador e execute o comando abaixo para instalá-lo:
   ```bash
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```

2. Após a instalação do Chocolatey, instale o k6 executando:
   ```bash
   choco install k6
   ```

#### **Via Windows Package Manager (winget)**

Se você preferir usar o **winget** (integrado ao Windows 10 e 11):

1. Abra o terminal e execute:
   ```bash
   winget install k6
   ```

#### **Via Executável Manual**

1. Acesse a página de [downloads do k6](https://k6.io/docs/getting-started/installation/).
2. Baixe o executável para a versão do Windows correspondente ao seu sistema.
3. Extraia o arquivo ZIP em uma pasta de sua preferência.
4. Adicione a pasta ao **Path** do sistema, permitindo que você execute o k6 de qualquer lugar no terminal.

---

### **2. Instalação no macOS**

A forma mais simples de instalar o k6 no macOS é utilizando o **Homebrew**, um gerenciador de pacotes muito popular no macOS.

#### **Via Homebrew (Recomendado)**

1. Se você não tem o Homebrew instalado, abra o terminal e execute o seguinte comando para instalá-lo:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Após a instalação do Homebrew, instale o k6 com o seguinte comando:
   ```bash
   brew install k6
   ```

---

### **3. Instalação no Linux**

No Linux, o k6 pode ser instalado facilmente via **apt** (para distribuições baseadas em Debian/Ubuntu), **yum** (para distribuições RHEL/CentOS), ou pelo **Homebrew** no Linux.

#### **Via APT (para Ubuntu/Debian)**

1. Adicione o repositório do k6:
   ```bash
   echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
   ```

2. Adicione a chave do repositório:
   ```bash
   curl -fsSL https://dl.k6.io/key.gpg | sudo tee /etc/apt/trusted.gpg.d/k6.asc
   ```

3. Atualize os pacotes e instale o k6:
   ```bash
   sudo apt update
   sudo apt install k6
   ```

#### **Via YUM (para CentOS/RHEL)**

1. Para distribuições como CentOS, execute os seguintes comandos:
   ```bash
   sudo curl -fsSL https://dl.k6.io/rpm/k6.repo -o /etc/yum.repos.d/k6.repo
   sudo yum install k6
   ```

#### **Via Homebrew (para Linux)**

Se você já tem o **Homebrew** instalado no Linux, pode instalar o k6 da mesma forma que no macOS:
   ```bash
   brew install k6
   ```

---

### **4. Verificando a Instalação**

Após a instalação, é importante verificar se o k6 foi instalado corretamente. Execute o seguinte comando no terminal:

```bash
k6 version
```

Se a instalação foi bem-sucedida, você verá a versão do k6 instalada, confirmando que tudo está pronto para uso.

---

### **5. Atualizando o k6**

Se precisar atualizar o k6, basta seguir as instruções de atualização de acordo com o gerenciador de pacotes que você usou:

- **Windows (via Chocolatey):**
  ```bash
  choco upgrade k6
  ```

- **macOS (via Homebrew):**
  ```bash
  brew upgrade k6
  ```

- **Linux (via apt):**
  ```bash
  sudo apt update
  sudo apt upgrade k6
  ```

---

Agora você está pronto para usar o k6 em seus testes de performance! Se tiver dúvidas sobre como criar e executar testes ou interpretar os resultados, fique à vontade para consultar a documentação ou entrar em contato.