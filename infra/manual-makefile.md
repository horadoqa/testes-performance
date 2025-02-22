# Makefile

```makefile
# Variáveis
TF_DIR = terraform
ANSIBLE_DIR = ansible
TF_VARS_FILE = terraform/terraform.tfvars
ANSIBLE_PLAYBOOK = ansible/playbook.yaml
ANSIBLE_INVENTORY = ansible/hosts.ini
AWS_DOCS = aws/aws.md
SG_DOCS = terraform/sg.md
TF_DOCS = terraform/terraform.md

# Comandos comuns
TF = terraform
ANSIBLE = ansible-playbook

# Inicialização do Terraform
init-terraform:
	@echo "Inicializando Terraform..."
	$(TF) init $(TF_DIR)

# Plan do Terraform
plan-terraform:
	@echo "Executando Terraform plan..."
	$(TF) plan -var-file=$(TF_VARS_FILE) $(TF_DIR)

# Aplicar Terraform
apply-terraform:
	@echo "Aplicando Terraform..."
	$(TF) apply -var-file=$(TF_VARS_FILE) $(TF_DIR)

# Destruir Terraform
destroy-terraform:
	@echo "Destruindo recursos Terraform..."
	$(TF) destroy -var-file=$(TF_VARS_FILE) $(TF_DIR)

# Inicializar o Ansible
init-ansible:
	@echo "Preparando ambiente do Ansible..."
	# Insira comandos para inicializar o Ansible, se necessário

# Executar o playbook do Ansible
run-ansible:
	@echo "Executando playbook Ansible..."
	$(ANSIBLE) -i $(ANSIBLE_INVENTORY) $(ANSIBLE_PLAYBOOK)

# Comando para rodar o Terraform e o Ansible em sequência
deploy:
	@echo "Inicializando e aplicando Terraform..."
	$(MAKE) init-terraform
	$(MAKE) apply-terraform
	@echo "Executando Ansible para configurar servidores..."
	$(MAKE) run-ansible

# Comando para rodar o Terraform e o Ansible em sequência, mas destruir tudo no final
destroy:
	@echo "Destruindo infraestrutura com Terraform..."
	$(MAKE) destroy-terraform
	@echo "Executando Ansible para limpar configuração..."
	$(MAKE) run-ansible

# Limpeza do estado do Terraform
clean:
	@echo "Limpando arquivos de estado do Terraform..."
	rm -rf $(TF_DIR)/.terraform/ $(TF_DIR)/*.tfstate $(TF_DIR)/*.tfstate.backup

# Exibir documentação
docs:
	@echo "Exibindo documentação..."
	@cat $(AWS_DOCS)
	@cat $(SG_DOCS)
	@cat $(TF_DOCS)

```

### Explicação das alterações:

1. **Caminhos ajustados**:
   - Como os arquivos do **Terraform** e do **Ansible** estão em diretórios específicos, os caminhos dos arquivos foram ajustados para corresponder à estrutura de diretórios.
     - `TF_DIR = terraform`: Refere-se ao diretório onde os arquivos Terraform estão localizados.
     - `TF_VARS_FILE = terraform/terraform.tfvars`: Refere-se ao arquivo de variáveis do Terraform.
     - `ANSIBLE_DIR = ansible`: Refere-se ao diretório onde o playbook Ansible está localizado.
     - `ANSIBLE_PLAYBOOK = ansible/playbook.yaml`: Caminho para o playbook do Ansible.
     - `ANSIBLE_INVENTORY = ansible/hosts.ini`: Caminho para o arquivo de inventário do Ansible.

2. **Novos alvos**:
   - **docs**: Um alvo para exibir a documentação associada. Ele usa `cat` para mostrar o conteúdo dos arquivos de documentação dentro de `aws/aws.md`, `terraform/sg.md`, e `terraform/terraform.md`.

3. **Comandos do Terraform**:
   - **init-terraform**: Inicializa o Terraform no diretório `terraform`.
   - **plan-terraform**: Cria o plano do Terraform, utilizando o arquivo de variáveis `terraform.tfvars`.
   - **apply-terraform**: Aplica a infraestrutura definida pelo Terraform.
   - **destroy-terraform**: Destrói a infraestrutura gerada pelo Terraform.

4. **Comandos do Ansible**:
   - **init-ansible**: Inicializa o ambiente Ansible, se necessário.
   - **run-ansible**: Executa o playbook do Ansible com o inventário especificado.

5. **Comandos Combinados**:
   - **deploy**: Executa o processo completo, desde a inicialização e aplicação do Terraform até a execução do Ansible.
   - **destroy**: Executa o processo de destruição da infraestrutura com Terraform, seguido pela execução do playbook Ansible para limpar configurações.

6. **Limpeza**:
   - **clean**: Remove arquivos de estado e backups do Terraform.

### Como Usar:

- **Inicializar o Terraform**:
  ```bash
  make init-terraform
  ```

- **Criar o plano do Terraform**:
  ```bash
  make plan-terraform
  ```

- **Aplicar as mudanças do Terraform**:
  ```bash
  make apply-terraform
  ```

- **Executar o playbook do Ansible**:
  ```bash
  make run-ansible
  ```

- **Deploy Completo** (Terraform + Ansible):
  ```bash
  make deploy
  ```

- **Destruir Infraestrutura** (Terraform + Ansible):
  ```bash
  make destroy
  ```

- **Limpar Arquivos de Estado do Terraform**:
  ```bash
  make clean
  ```

- **Exibir a documentação** (Arquivos Markdown):
  ```bash
  make docs
  ```

### Considerações:

1. **Customização**:
   - Caso precise adicionar mais etapas ou variáveis, o `Makefile` pode ser facilmente adaptado. Certifique-se de atualizar as variáveis como o caminho do `terraform.tfvars` ou do `inventory` se necessário.
  
2. **Inventário Ansible**:
   - Certifique-se de que o arquivo de inventário `ansible/hosts.ini` esteja corretamente configurado com as informações das instâncias que o **Ansible** irá gerenciar.

Isso deve proporcionar um fluxo de trabalho simples e eficiente para trabalhar com **Terraform** e **Ansible** de acordo com a estrutura de diretórios fornecida.