
##INSTALACIÓN Y CONFIGURACIÓN DE LAMP (obviar mysql)
sudo apt update
sudo apt upgrade
###Instalación de apache web server##########
sudo apt install -y apache2 apache2-utils
sudo systemctl enable apache2
sudo systemctl start apache2
#validación de servicio
#systemctl status apache2
#configuracion de permisos en el firewall (web-ssl-mariadb)
sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 3306 -j ACCEPT
sudo ufw allow http
sudo ufw allow https
sudo ufw allow mysql
#configuacion de ServerName
mkdir -R /etc/apache2/conf-available/ncserver.conf
cat <<NCSERVER_CONF
# /etc/apache2/conf-available/ncserver.conf
ServerName localhost
NCSERVER_CONF
) > /etc/apache2/conf-available/ncserver.conf

#####Instalacion de PHP#######################
sudo apt install php7.4 libapache2-mod-php7.4 php7.4-mysql php-common php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline
#habilitacio de php7
sudo a2enmod php7.4
#reinicio de servicio
sudo systemctl restart apache2
##php --version
sudo vim /var/www/html/info.php
cat <<INFO_PHP
# /var/www/html/info.php
<?php phpinfo(); ?>
INFO_PHP
) > /var/www/html/info.php

####################################################
#descargar paquetre unzip
sudo apt install unzip
#descargar el paquete nextloid 23
wget https://download.nextcloud.com/server/releases/nextcloud-23.0.3.zip
#se descomprime el paque direccionando a /var/www
sudo unzip nextcloud-23.0.3.zip -d /var/www/
#configuración de permisos www-data al path de nextcloud
sudo chown www-data:www-data /var/www/nextcloud/ -R

##CREACIÓN DE UN VIRTUALHOST PARA NEXTCLOUD
sudo vim /etc/apache2/sites-available/nextcloud.conf
cat <<NEXTCLOUD_CONF
Alias /nextcloud "/var/www/nextcloud/"

<Directory /var/www/nextcloud/>
  Options +FollowSymlinks
  AllowOverride All

 <IfModule mod_dav.c>
  Dav off
 </IfModule>

 SetEnv HOME /var/www/nextcloud
 SetEnv HTTP_HOME /var/www/nextcloud

</Directory>


NEXTCLOUD_CONF
) > /etc/apache2/sites-available/nextcloud.conf
#cat <<NEXTCLOUD_CONF
#<VirtualHost *:80>
#        DocumentRoot "/var/www/nextcloud"
#        ServerName nextcloud.example.com
#
#       ErrorLog ${APACHE_LOG_DIR}/nextcloud.error
#      CustomLog ${APACHE_LOG_DIR}/nextcloud.access combined
#
#       <Directory /var/www/nextcloud/>
#          Require all granted
#         Options FollowSymlinks MultiViews
#        AllowOverride All
#
#          <IfModule mod_dav.c>
#             Dav off
#        </IfModule>
#
#       SetEnv HOME /var/www/nextcloud
#      SetEnv HTTP_HOME /var/www/nextcloud
#     Satisfy Any
#
#      </Directory>

#</VirtualHost>
#NEXTCLOUD_CONF
#) > /etc/apache2/sites-available/nextcloud.conf

#habilitacion de virtualhost y comandos necesarios
sudo a2ensite nextcloud.conf
sudo a2enmod rewrite headers env dir mime setenvif ssl
#realizar un test a la configuracion de apache
sudo apache2ctl -t

###PAQUETES PHP RECOMENDADOS POR NEXTCLOUD
sudo apt install imagemagick php-imagick libapache2-mod-php7.4 php7.4-common php7.4-mysql php7.4-fpm php7.4-gd php7.4-json php7.4-curl php7.4-zip php7.4-xml php7.4-mbstring php7.4-bz2 php7.4-intl php7.4-bcmath php7.4-gmp

sudo systemctl reload apache2

################################HABILITACION HTTPS###################
#debemos contar con la llave y sel certificado fullchain
sudo vim /etc/apache2/sites-available/default-ssl.conf
cat <<SSL_CONF

SSLCertificateFile /etc/ssl/certs/wildcard.cntcloud.com.pem
SSLCertificateKeyFile /etc/ssl/certs/cntcloud.com.key
SSL_CONF
) > /etc/apache2/sites-available/default-ssl.conf

#######aceptar conexiones en config.php para la intgeracion de onlyoffice
###en /var/www/nextcloud/config
'allow_local_remote_servers' => true,