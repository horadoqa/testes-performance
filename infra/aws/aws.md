# AWS

Exemplo para listar apenas os IDs das instâncias:

aws ec2 describe-instances --region us-east-1 --query "Reservations[*].Instances[*].InstanceId"

Exemplo para listar os nomes das instâncias (usando tags):

aws ec2 describe-instances --region us-east-1 --query "Reservations[*].Instances[*].Tags[?Key=='Name'].Value"

Comando para listar IPs públicos das instâncias

aws ec2 describe-instances --region us-east-1 --query "Reservations[*].Instances[*].PublicIpAddress" --output text


