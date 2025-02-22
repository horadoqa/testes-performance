# Download e Install

## Fazer o download do arquivo

https://prometheus.io/download/

prometheus-2.50.1.linux-amd64.tar.gz

## copiar para a instância na AWS

scp /mnt/c/Users/Fahham/Downloads/prometheus-2.50.1.linux-amd64.tar.gz ec2-user@ec2-34-235-123-76.compute-1.amazonaws.com:~

## Acessar a instância e descompactar o arquivo

ssh ec2-user@ec2-54-211-253-192.compute-1.amazonaws.com

## Conferir cópia

[ec2-user@ip-172-31-6-228 ~]$ ls -la
total 96692
drwx------. 3 ec2-user ec2-user      118 Mar 11 12:59 .
drwxr-xr-x. 3 root     root           22 Mar 11 12:39 ..
-rw-r--r--. 1 ec2-user ec2-user       18 Jan 28  2023 .bash_logout
-rw-r--r--. 1 ec2-user ec2-user      141 Jan 28  2023 .bash_profile
-rw-r--r--. 1 ec2-user ec2-user      492 Jan 28  2023 .bashrc
drwx------. 2 ec2-user ec2-user       29 Mar 11 12:39 .ssh
-rwxrwxr-x. 1 ec2-user ec2-user 98996658 Mar 11 13:00 prometheus-2.50.1.linux-amd64.tar.gz

## Descompactar arquivo zipado

tar -xzf prometheus-2.50.1.linux-amd64.tar.gz

## Acessar pasta

cd prometheus-2.50.1.linux-amd64/

## Alterar o arquivo

prometheus.yml

static_configs:
       - targets: ['localhost:9100']

## Inicie o serviço Prometheus:

./prometheus --config.file=./prometheus.yml

## Habilitar o prometheus

./prometheus --web.listen-address="0.0.0.0:9090"

## Acessar pelo IP público

34.200.224.202:9090

http://34.200.224.202:9090/metrics

## DEMO

url https://demo.promlabs.com