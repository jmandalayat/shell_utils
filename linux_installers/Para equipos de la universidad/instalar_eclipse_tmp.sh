# Script para instalar Eclipse en los ordenadores virtuales del Departamento de Ingeniería Telemática de
# la Universidad Carlos III de Madrid

#! /bin/bash

# Pasamos al directorio temporal
cd /tmp

# Descargamos y descomprimimos
wget http://www.lab.it.uc3m.es/labgcd/eclipse-cdist-linux-x86_64.tar.gz
tar -xvf eclipse-cdist-linux-x86_64.tar.gz
rm eclipse-cdist-linux-x86_64.tar.gz
