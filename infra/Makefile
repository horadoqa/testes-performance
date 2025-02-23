# Variáveis
TF_DIR = terraform
ANSIBLE_DIR = ansible
TF_VARS_FILE = terraform.tfvars
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
	$(TF) -chdir=$(TF_DIR) init

# Plan do Terraform
plan-terraform:
	@echo "Executando Terraform plan..."
	$(TF) -chdir=$(TF_DIR) plan -var-file=$(TF_VARS_FILE)

# Aplicar Terraform
apply-terraform:
	@echo "Aplicando Terraform..."
	$(TF) -chdir=$(TF_DIR) apply --auto-approve -var-file=$(TF_VARS_FILE)

# Destruir Terraform
destroy-terraform:
	@echo "Destruindo recursos Terraform..."
	$(TF) -chdir=$(TF_DIR) destroy --auto-approve -var-file=$(TF_VARS_FILE)

# Inicializar o Ansible
init-ansible:
	@echo "Preparando ambiente do Ansible..."
	# Insira comandos para inicializar o Ansible, se necessário

# Executar o playbook do Ansible
run-ansible:
	@echo "Executando playbook Ansible..."
	ANSIBLE_HOST_KEY_CHECKING=False $(ANSIBLE) -i $(ANSIBLE_INVENTORY) $(ANSIBLE_PLAYBOOK)

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

# Exibir ajuda
help:
	@echo "Comandos disponíveis:"
	@echo "  make init-terraform          - Inicializa o ambiente Terraform."
	@echo "  make plan-terraform          - Executa o comando 'terraform plan'."
	@echo "  make apply-terraform         - Executa o comando 'terraform apply'."
	@echo "  make destroy-terraform       - Executa o comando 'terraform destroy'."
	@echo "  make init-ansible            - Inicializa o ambiente do Ansible."
	@echo "  make run-ansible             - Executa o playbook do Ansible."
	@echo "  make deploy                  - Roda o Terraform e o Ansible em sequência."
	@echo "  make destroy                 - Roda o Terraform e o Ansible para destruir a infraestrutura."
	@echo "  make clean                   - Limpa os arquivos de estado do Terraform."
	@echo "  make docs                    - Exibe a documentação do projeto."
	@echo "  make help                    - Exibe este menu de ajuda."
