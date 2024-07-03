# Script para instalar Jmeter en los ordenadores virtuales del Departamento de Ingeniería Telemática de
# la Universidad Carlos III de Madrid

#! /bin/bash

# Pasamos al directorio temporal
cd /tmp

# Descargamos y descomprimimos
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.4.3.tgz
tar -xvf apache-jmeter-5.4.3.tgz
rm apache-jmeter-5.4.3.tgz
