# Script para instalar las utilidades de Google Cloud en los ordenadores virtuales del Departamento de
# Ingeniería Telemática de la Universidad Carlos III de Madrid

#! /bin/bash

# Pasamos al directorio temporal
cd /tmp

# Descargamos y descomprimimos
wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-389.0.0-linux-x86_64.tar.gz
tar -xvf google-cloud-cli-389.0.0-linux-x86_64.tar.gz
rm google-cloud-cli-389.0.0-linux-x86_64.tar.gz

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
