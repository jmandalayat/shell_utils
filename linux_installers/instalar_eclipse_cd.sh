#! /bin/bash



# Eclipse para Computación Distribuida

# Creamos y pasamos al directorio de programas
"$SCRIPTS/programas.sh"
cd $HOME/Programas/

# Descargamos y descomprimimos (versión de la universidad para Computación Distribuida)
wget http://www.lab.it.uc3m.es/labgcd/eclipse-cdist-linux-x86_64.tar.gz
tar -xvf eclipse-cdist-linux-x86_64.tar.gz
rm eclipse-cdist-linux-x86_64.tar.gz
