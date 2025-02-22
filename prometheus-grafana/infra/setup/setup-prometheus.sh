echo ""

echo "Copiando o prometheus e o node_exporter para o servidor"
scp prometheus-2.50.1.linux-amd64.tar.gz node_exporter-1.7.0.linux-amd64.tar.gz ec2-user@ec2-<IP>.compute-1.amazonaws.com:~

ssh ec2-user@ec2-34-239-187-3.compute-1.amazonaws.com

tar -xzf prometheus-2.50.1.linux-amd64.tar.gz

tar -xzf node_exporter-1.7.0.linux-amd64.tar.gz

cd prometheus-2.50.1.linux-amd64/

open http://34.239.187.3:9090/metrics

./prometheus --web.listen-address="0.0.0.0:9090"


echo "Copiando o grafana para o servidor"
scp grafana-8.5.2-1.x86_64.rpm ec2-user@ec2-<IP>.compute-1.amazonaws.com:~

echo "Cópias concluidas !!!"