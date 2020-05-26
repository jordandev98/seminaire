# Seminaire intégration continue avec Jenkins

#Installation de Jenkins

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian binary/" | sudo tee -a /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt install default-jdk
sudo apt install maven
sudo apt install git
sudo apt-get install jenkins
sudo /etc/init.d/jenkins start

#Installation du serveur web Apache et configuration du proxy

sudo apt-get install apache2
sudo a2enmod proxy
sudo a2enmod proxy_http

sudo vim /etc/apache2/sites-available/jenkins.conf
<VirtualHost *:80>
	ServerName ec2-54-157-168-8.compute-1.amazonaws.com
	ProxyRequests Off
	<Proxy *>
		Order deny,allow
		Allow from all
	</Proxy>
	ProxyPreserveHost on
	ProxyPass / http://localhost:8080/
</VirtualHost>

#Groupe de sécurité serveur web

Règle TCP personnalisée
TCP
8080
0.0.0.0/0
Règle TCP personnalisée
TCP
8080
::/0
SSH
TCP
22
0.0.0.0/0

#Ajouter Jenkins à Apache2

sudo a2ensite jenkins
sudo service apache2 reload

#Installer Tomcat 
cd /opt
wget https://muug.ca/mirror/apache-dist/tomcat/tomcat-8/v8.5.55/bin/apache-tomcat-8.5.55.tar.gz
tar -xvzf /opt/apache-tomcat-8.5.55.tar.gz
chmod +x /opt/apache-tomcat-8.5.55/bin/startup.sh 
shutdown.sh

#Modifier les parametres de context.xml pour pouvoir se connecter

find / -name context.xml
vim /opt/apache-tomcat-8.5.55/webapps/host-manager/META-INF/context.xml
vim /opt/apache-tomcat-8.5.55/webapps/manager/META-INF/context.xml

Commenter la balise Valve

#Ajouter les groupes utilisateurs
find / -name context.xml

<role rolename="manager/>
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
<user username="deployer" password="deployer" roles="manager-script"/>
<user username="tomcat" password="s3cret" roles="manager-gui"/>


#Ajouter le user deployer dans Jenkins

username : deployer
password : deployer
Id : deployer

#Configuration Jenkins


Jdk 
which java

GIT
which git

Maven
mvn -version


#Configuration de Github

Settings -> webhooks
http://ec2-54-157-168-8.compute-1.amazonaws.com/github-webhook/