# Preparando infra

## Terraform

Inicializando o terraform

```bash
sudo terraform providers lock
terraform init
```

Verificando o plano

```bash
terraform plan
```

Aplii=cando o plano

```bash
terraform apply
```

## Ansible

[install](./infra/ansible/playbook.yaml)

## Prometheus

[AWS](./infra/prometheus/install-aws.md)
[GCP](./infra/prometheus/install-gcp.md)

## Grafana

[AWS](./infra/grafana/install-aws.md)
[GCP](./infra/grafana/install-gcp.md)