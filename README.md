# seminaire
seminaire

**Installation de Jenkins

sudo apt install default-jre
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
sudo /etc/init.d/jenkins start

**Installation du serveur web Apacheet configuration du proxy

sudo apt-get install apache2
sudo a2enmod proxy
sudo a2enmod proxy_http

sudo vim /etc/apache2/sites-available/jenkins.conf
<VirtualHost *:80>
	ServerName ec2-100-25-199-7.compute-1.amazonaws.com
	ProxyRequests Off
	<Proxy *>
		Order deny,allow
		Allow from all
	</Proxy>
	ProxyPreserveHost on
	ProxyPass / http://localhost:8080/
</VirtualHost>

** Ajouter Jenkins à Apache2

sudo a2ensite jenkins
sudo service apache2 reload

