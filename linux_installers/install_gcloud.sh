#! /bin/bash



# Google Cloud

# Creamos y pasamos al directorio de instalación elegido
cd "$1"

# Descargamos y descomprimimos
wget "$2"
tar -xvf google-cloud-cli-*.tar.gz
rm google-cloud-cli-*.tar.gz

# Instalamos
./google-cloud-sdk/install.sh

# Actualizamos
./google-cloud-sdk/bin/gcloud components update

# Iniciamos
./google-cloud-sdk/bin/gcloud init