#!/bin/bash
apt-get build-dep mod-security-common
mkdir -p builds/modsecurity
cd builds/modsecurity/
wget -c http://www.modsecurity.org/tarball/2.7.2/modsecurity-apache_2.7.2.tar.gz
tar xvf modsecurity-apache_2.7.2.tar.gz
./configure
