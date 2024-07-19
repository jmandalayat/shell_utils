#! /bin/bash

if [[ $# -ne 1 ]]
then
	echo "Modo de uso:"
	echo -e "\tdes-git <ruta al repositorio local>"
	exit

fi

if [[ -d "$1" ]]
then
	find "$1" -name ".git*" -exec rm {} +
else
	echo -e "No existe el directorio especificado: $1"
	exit
fi