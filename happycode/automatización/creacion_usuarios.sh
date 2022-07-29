##CREACIÓN USUARIOS
#sudo -u www-data php occ user:add --display-name="Richard" --group="INGENIERÍA DATA CENTER" --email="richard.osorio@cntcloud.com"
#php /var/www/nextcloud/occ user:add --password-from-env --display-name="Richard" --group="INGENIERÍA DATA CENTER" Richard
sudo -u www-data php occ user:add --password-from-env --display-name="Xavi" --group="INGENIERÍA DATA CENTER" Xavi
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --email="myemail@domain.com" --group="user" myusername'
###################################################################
cat inghappybox.csv | while read line
 do
    user=$(echo $line | awk -F";" '{print $1}')
    export OC_PASS=$(echo $line | awk -F";" '{print $2}')
    su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="$user" --group="INGENIERÍA DATA CENTER" $user'
###################################################################

export OC_PASS=Cnt.:2022az
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Ana" --group="INGDC" Ana'

export OC_PASS=Cnt.2022fg
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Fernando Gonzalez" --group="INGDC" Fer'

export OC_PASS=Cnt.:2022jv
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Jorge" --group="INGDC" Jorge'

sudo -u www-data php occ user:setting Richard settings email "richard.osorio@cntcloud.com"
sudo -u www-data php occ user:setting Richard settings email "richard.osorio@cntcloud.com"

##ASIGNACIÓN QUOTA STORAGE
sudo -u www-data php occ user:setting robertO files quota 1GB
sudo -u www-data php occ user:setting robertO files quota 5GB\

##RESET PASSWORDS
sudo -u apache php /var/www/html/nextcloud/occ user:resetpassword

#Creación de usuarios
########INGTX########################
export OC_PASS=Cnt.:2022vv
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="VeronicaV" --group="INGTX" Veronica'
sudo -u www-data php occ user:setting Veronica settings email "veronica.vega@cnt.gob.ec"

export OC_PASS=Cnt.:2022jd
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Jaime" --group="INGTX" JaimeD'
sudo -u www-data php occ user:setting JaimeD settings email "jaime.duenias@cnt.gob.ec"

export OC_PASS=Cnt.:2022we
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Wellington Espinoza" --group="INGTX" WellingtonE'
sudo -u www-data php occ user:setting WellingtonE settings email "ellington.espinoza@cnt.gob.ec"

export OC_PASS=Cnt:2022rm
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Roberto Mendoza" --group="INGTX" RobertoM'
sudo -u www-data php occ user:setting RobertoM settings email "roberto.mendoza@cnt.gob.ec"

#########RAG (redes acceso guayas)################
export OC_PASS=Cnt.2022mjl
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Maria Jose Loor" --group="RAG" MariaJL'
sudo -u www-data php occ user:setting MariaJL settings email "mariaj.loor@cnt.gob.ec"

export OC_PASS=Cnt.2022di
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Daniel Illescas" --group="RAG" DanielI'
sudo -u www-data php occ user:setting DanielI settings email "daniel.illescas@cnt.gob.ec"

export OC_PASS=Cnt.2022cs
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Cristian Serrano" --group="RAG" CristianS'
sudo -u www-data php occ user:setting CristianS settings email "cristian.serrano@cnt.gob.ec"

###########INGCPC(core y plataformas convergentes)#################
export OC_PASS=Cnt.2022vm
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Vicenta Macias" --group="INGCPC" VicentaM'
sudo -u www-data php occ user:setting VicentaM settings email "vicenta.macias@cnt.gob.ec"

###########O&MDC#################
export OC_PASS=Cnt.2022jc
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Javier Castillo" --group="O&MDC" JaviC'
sudo -u www-data php occ user:setting JaviC settings email "javier.castillo@cnt.gob.ec"

export OC_PASS=Cnt.2022cr
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Cesar Ricaurte" --group="O&MDC" CesarR'
sudo -u www-data php occ user:setting CesarR settings email "cesar.ricaurte@cnt.gob.ec"

export OC_PASS=Cnt.2022ef
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Elizabeth Falconi" --group="O&MDC" EliF'
sudo -u www-data php occ user:setting EliF settings email "elizabeth.falconi@cnt.gob.ec"

export OC_PASS=Cnt.2022jc
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Javier Castillo" --group="O&MDC" JaviC'
sudo -u www-data php occ user:setting JaviC settings email "javier.castillo@cnt.gob.ec"

export OC_PASS=Cnt.2022ds
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Diego Soria" --group="O&MDC" DiegoS'
sudo -u www-data php occ user:setting CesarR settings email "diego.soria@cnt.gob.ec"

export OC_PASS=Cnt.2022vs
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Victor Suntaxi" --group="O&MDC" VictorS'
sudo -u www-data php occ user:setting VictorS settings email "victor.suntaxi@cnt.gob.ec"

export OC_PASS=Cnt.2022jc
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Jose Cassinelli" --group="O&MDC" JoseC'
sudo -u www-data php occ user:setting JoseC settings email "jose.cassinelli@cnt.gob.ec"

export OC_PASS=Cnt.2022ap
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Andres Paez" --group="O&MDC" AndresP'
sudo -u www-data php occ user:setting AndresP settings email "andres.paez@cnt.gob.ec"

export OC_PASS=Cnt.2022sa
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Saul Ashqui" --group="O&MDC" SaulA'
sudo -u www-data php occ user:setting SaulA settings email "saul.ashqui@cnt.gob.ec"

###########CORPORATIVO#################
export OC_PASS=Cnt.2022JS
su -s /bin/sh www-data -c 'php occ user:add --password-from-env --display-name="Jorge Solano" --group="CORPORATIVO" JorgeS'
sudo -u www-data php occ user:setting JorgeS settings email "jorge.solano@cnt.gob.ec"
