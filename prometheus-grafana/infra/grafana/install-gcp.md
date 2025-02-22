# Install

Criar a instância via terraform

## Baixa o rpm:

via browser

https://dl.grafana.com/oss/release/grafana-8.5.2-1.x86_64.rpm

via wget

wget https://dl.grafana.com/oss/release/grafana-8.5.2-1.x86_64.rpm

## Copiar para o servidor

$ scp ~/Downloads/grafana-8.5.2-1.x86_64.rpm ricardo_fahham_g_globo@$10.93.154.43:~



Acessar a instância
$ ssh ricardo_fahham_g_globo@$ip

Instalar dependencias:
	fontconfig is needed by grafana-8.5.2-1.x86_64
	urw-fonts is needed by grafana-8.5.2-1.x86_64

script.sh

$ sudo yum install fontconfig urw-fonts -y

$ sudo rpm -i grafana-8.5.2-1.x86_64.rpm

$ sudo /bin/systemctl daemon-reload

$ sudo /bin/systemctl enable grafana-server.service

$ sudo /bin/systemctl start grafana-server.service

Acessar no browser: http://10.93.154.7:3000

admin
admin



netstat -atunp | grep 3000

bin/grafana-server
