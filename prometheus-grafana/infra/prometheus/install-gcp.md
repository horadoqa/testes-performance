Fazer o download do arquivo

https://prometheus.io/download/

prometheus-2.50.1.linux-amd64.tar.gz

copiar para a instância do prometheus no GCP

$ scp ~/Downloads/prometheus-2.50.1.linux-amd64.tar.gz ricardo_fahham_g_globo@10.93.154.4:~

Acessar a instância e descompactar o arquivo

$ ssh ricardo_fahham_g_globo@10.88.100.167
[ricardo_fahham_g_globo@gce-us-e1-prometheus-k6-qa-prod ~]$ ls
prometheus-2.37.0.linux-amd64.tar.gz

$ tar -xzf prometheus-2.44.0.linux-amd64.tar.gz

$ cd prometheus-2.44.0.linux-amd64.tar.gz

$ ./prometheus --web.listen-address="0.0.0.0:9090"