#!/bin/bash
apt-get build-dep mod-security-common
apt-get install git build-essential
mkdir -p builds/modsecurity
cd builds/modsecurity/
wget -c http://www.modsecurity.org/tarball/2.7.2/modsecurity-apache_2.7.2.tar.gz
tar xvf modsecurity-apache_2.7.2.tar.gz
./configure
make
make CFLAGS=-DMSC_TEST test
make install
cp mod_security.conf /etc/apache2/mods-aviable/mod_security2.conf
mkdir /etc/apache2/modsecurity.d/
git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git
cp owasp-modsecurity-crs/* /etc/apache2/modsecurity.d/ -rv
cd /etc/apache2/modsecurity.d/
for f in `ls base_rules/` ; do sudo ln -s /etc/apache2/modsecurity.d/base_rules/$f activated_$
for f in `ls optional_rules/ | grep comment_spam` ; do sudo ln -s /etc/apache2/modsecurity.d/$
ls -lh activated_rules/
ln /etc/apache2/mods-available/mod_security2.conf /etc/apache2/mods-enabled/ -sv
sed 's/SecDefaultAction "phase:1,deny,log"/SecDefaultAction "phase:1,pass,log"/' modsecurity_crs_10_setup.conf.example > modsecurity_crs_10_setup.conf 
service apache2 restart
