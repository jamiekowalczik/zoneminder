#!/bin/bash
sudo setenforce 0
sudo sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/sysconfig/selinux
sudo sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/selinux/config
sudo yum -y update
sudo yum -y install wget
wget http://zmrepo.zoneminder.com/el/7/x86_64/zmrepo-7-7.el7.centos.noarch.rpm
sudo yum -y install --nogpgcheck zmrepo-7-7.el7.centos.noarch.rpm
sudo yum -y install zoneminder
sudo systemctl enable mariadb
sudo systemctl start mariadb    
sudo mysql_secure_installation <<EOF

y
password
password
y
y
y
y
EOF
mysql -uroot --password="password" < /usr/share/zoneminder/db/zm_create.sql
mysql -uroot --password="password" -e "grant all on zm.* to \
      'zmuser'@localhost identified by 'zmpass';"
mysqladmin -uroot --password="password" reload
sudo yum -y install mod_ssl
sudo sed -i 's/;date.timezone =/date.timezone = "America\/New_York"/g' /etc/php.ini
#mysql zm -u root --password="password" -e "UPDATE Config SET Value = '/zm/cgi-bin-zm/nph-zms' WHERE Name = 'ZM_PATH_ZMS';"
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl enable zoneminder
sudo systemctl start zoneminder
sudo reboot
