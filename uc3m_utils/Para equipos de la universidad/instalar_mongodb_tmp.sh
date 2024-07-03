# Script para instalar MongoDB en los ordenadores virtuales del Departamento de Ingeniería Telemática de
# la Universidad Carlos III de Madrid

#! /bin/bash

# Creamos un directorio al efecto
mkdir -p /tmp/mongodb

# Pasamos al directorio temporal
cd /tmp/mongodb/

# Descargamos y descomprimimos el software de la base de datos
wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-debian11-5.0.9.tgz
tar -zxvf mongodb-linux-x86_64-debian11-5.0.9.tgz
rm mongodb-linux-x86_64-debian11-5.0.9.tgz

# Descargamos y descomprimimos el software de exploración
wget https://downloads.mongodb.com/compass/mongodb-compass_1.32.2_amd64.deb
sudo dpkg -i mongodb-compass_1.32.2_amd64.deb
rm mongodb-compass_1.32.2_amd64.deb

# Creamos un directorio para guardar los datos
mkdir -p /tmp/mongodb/data/db
