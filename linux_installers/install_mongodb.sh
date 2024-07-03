#! /bin/bash



# MongoDB

# Creamos el directorio de programas
"$SCRIPTS/programas.sh"

# Creamos un directorio al efecto
mkdir -p $HOME/Programas/mongodb

# Pasamos al directorio
cd $HOME/Programas/mongodb/

# Descargamos y descomprimimos el software
wget https://fastdl.mongodb.org/linux/mongodb-linux-[versión].tgz
tar -zxvf mongodb-linux-[versión].tgz
rm mongodb-linux-[versión].tgz

# Descargamos y descomprimimos el software de exploración
wget https://downloads.mongodb.com/compass/mongodb-compass_[versión].deb
sudo dpkg -i mongodb-compass_[versión].deb
rm mongodb-compass_[versión].deb

# Creamos un directorio para guardar los datos
mkdir -p $HOME/Programas/mongodb/data/db
