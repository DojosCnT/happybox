
##INSTALACIÓN Y CONFIGURACIÓN DE LAMP (obviar mysql)

   20  vim /etc/yum.repos.d/nginx.repo
   21  sudo yum install nginx
   22  vim /etc/nginx/nginx.conf
   23  sudo yum install epel-release
   24  sudo yum install postgresql postgresql-server
   25  sudo service postgresql initdb
   26  sudo chkconfig postgresql on
   27  cat /var/lib/pgsql/data/pg_hba.conf
   28  vim /var/lib/pgsql/data/pg_hba.conf
   29  sudo service postgresql restart
   30  cd /tmp
   31  sudo -u postgres psql -c "CREATE DATABASE onlyoffice;"
   32  sudo -u postgres psql -c "CREATE USER onlyoffice WITH password 'onlyoffice';"
   33  sudo -u postgres psql -c "GRANT ALL privileges ON DATABASE onlyoffice TO onlyoffice;"
   34  sudo yum install redis
   35  sudo service redis start
   36  sudo systemctl enable redis
   37  sudo yum install rabbitmq-server
   38  sudo service rabbitmq-server start
   39  sudo systemctl enable rabbitmq-server
   40  sudo yum install cabextract xorg-x11-font-utils
   41  sudo yum install fontconfig
   42  sudo rpm -i https://deac-ams.dl.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
   43  sudo yum install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm
   44  sudo yum install onlyoffice-documentserver-ee
       sudo yum install onlyoffice-documentserver
   45  sudo service supervisord start
   46  sudo systemctl enable supervisord
   47  sudo service nginx start
   48  sudo systemctl enable nginx
   49  ip a
   50  ping 8.8.8.8
   51  sudo supervisorctl start ds:example

   ##configuracion certificado de seguridad
   ds.conf en /etc/onlyoffice/documentserver/nginx
  server {
  #listen 0.0.0.0:80;
  listen 443 ssl;
  #listen [::]:80 default_server;
  server_tokens off;

  include /etc/nginx/includes/ds-*.conf;
  ssl_certificate /tmp/wildcard.cntcloud.com.pem;
  ssl_certificate_key /tmp/cntcloud.com.key;
}

  ##para la integracion con only office es necesario setear el siguiente parametro
   #You can disable certificate verification in DS config /etc/onlyoffice/documentserver/default.json by setting rejectUnauthorized to false. 
   #After that, you need to restart DS services: supervisorctl restart all If that doesn't help, specify the version, OS and installation type of the DocumentServer.

