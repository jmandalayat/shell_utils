#! /bin/bash

# Se actualiza la base de datos de los repositorios
echo "Actualizando listas de repositorios"
sudo apt-get update
echo

# Se actualizan los paquetes
echo "Actualizando paquetes"
upgrade_output=$(sudo apt-get upgrade -y)
echo "$upgrade_output"
echo

# Se comprueba si hay paquetes retenidos
echo "Comprobando paquetes retenidos..."
if [[ $(echo "$upgrade_output" | grep "retenido") || $(echo "$upgrade_output" | grep "kept back") ]]
then
	echo "Se han encontrado paquetes retenidos..."
	echo "Se procede a su instalación"
else
	echo "No se han encontrado paquetes retenidos"
fi

# Mientras haya paquetes retenidos, se instalan
while [[ $(echo "$upgrade_output" | grep "retenido") ]]
do
	sudo apt-get install -y $(echo "$upgrade_output" | awk 'BEGIN { x=0 } ; /retenido/ { x=1 } ; x==2 { print $0 ; x=0 } ; x==1 { x=2 }')
	upgrade_output=$(sudo apt-get upgrade -y)
done

# Mientras haya paquetes retenidos, se instalan
while [[ $(echo "$upgrade_output" | grep "kept back") ]]
do
	sudo apt-get install -y $(echo "$upgrade_output" | awk 'BEGIN { x=0 } ; /kept back/ { x=1 } ; x==2 { print $0 ; x=0 } ; x==1 { x=2 }')
	upgrade_output=$(sudo apt-get upgrade -y)
done

echo

# Se desinstalan los paquetes no necesarios
echo "Desinstalando paquetes no necesarios..."
sudo apt-get autoremove -y --purge
echo

# Se eliminan los paquetes
echo "Eliminando paquetes no necesarios..."
sudo apt-get autoclean
echo

# Se actualizan los paquetes de Snap
if [[ $(whereis snap | grep "/") ]]
then
	echo "Actualizando paquetes de snap..."
	sudo snap refresh
	echo
fi

# Se actualizan los elementos de Plasma administrados por Discover
if [[ $(whereis plasma-discover-update | grep "/") ]]
then
	echo "Actualizando elementos de Plasma Discover..."
	plasma-discover-update
	echo
fi

# Se actualizan los elementos de Google Cloud CLI
if [[ $(whereis gcloud | grep "/") ]]
then
	echo "Actualizando elementos de Google Cloud CLI..."
	gcloud components update
	echo
fi
