#! /bin/bash



# JMeter

# Creamos y pasamos al directorio de programas
"$SCRIPTS/programas.sh"
cd $HOME/Programas/

# Descargamos y descomprimimos
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-[versión].tgz
tar -xvf apache-jmeter-[versión].tgz
rm apache-jmeter-[versión].tgz
