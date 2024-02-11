#! /bin/bash



# Google Cloud

# Creamos y pasamos al directorio de programas
"$SCRIPTS/programas.sh"
cd $HOME/Programas/

# Descargamos y descomprimimos
wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-[versión].tar.gz
tar -xvf google-cloud-cli-[versión].tar.gz
rm google-cloud-cli-[versión].tar.gz

# Instalamos
./google-cloud-sdk/install.sh

# Instalamos Java
./google-cloud-sdk/bin/gcloud components install app-engine-java

# Instalamos Python
./google-cloud-sdk/bin/gcloud components install app-engine-python

# Habilitamos los APIs para despliegue en la nube
./google-cloud-sdk/bin/gcloud services enable cloudbuild.googleapis.com
./google-cloud-sdk/bin/gcloud services enable serviceusage.googleapis.com
./google-cloud-sdk/bin/gcloud services enable sqladmin.googleapis.com

# Actualizamos
./google-cloud-sdk/bin/gcloud components update
