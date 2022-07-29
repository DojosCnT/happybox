#Instalacion de maria db
sudo apt install mariadb-server mariadb-client

#habilitacio  e inicio del servicio
systemctl enable mariadb
systemctl start mariadb

#script de postinstalcion segura
sudo mysql_secure_installation
#configurar nuevo password ed mysql, y configurar
#setear todos los paramtreos que se encuentra por defecto
#no deshabilitar la opcion de conexion root remota
#sudo mariadb -u root


##CREACION DE UNA BDD para NEXTCLOUD
sudo mysql

#VALIDACION DE COMANDOS HEREDOCS
create database nextcloud;
create user nextclouduser@localhost identified by 'NextCloud.2022dp';
grant all privileges on nextcloud.* to nextclouduser@localhost identified by 'NextCloud.2022dp';
flush privileges;
exit;


#CONFIGURACIÓN DE ACCESO REMOTO
#comentarar la siguiente linea
#HEREDOCS
#/etc/mysql/mariadb.conf.d/50-server.cnf
bind-address            = 0.0.0.0
#bind-address            = 127.0.0.1

#dentro de mysql configurar los permisos de conexion remota
GRANT ALL PRIVILEGES ON *.* TO 'nextclouduser'@'10.150.41.171' IDENTIFIED BY 'NextCloud.2022dp' WITH GRANT OPTION;


