#! /bin/bash

if [[ $# -ne 1 ]]
then
	echo "Modo de uso:"
	echo -e "\tpull-full <ruta al directorio con repositorios>"
	exit

fi

if [[ -d "$1" ]]
then
	REP_LIST=$(ls "$1")

	for REP in $REP_LIST
	do
		echo "Descargando cambios en [$REP]"
		cd "$HOME/Repositorios/$REP"
		git pull
		echo
	done
else
	echo -e "No existe el directorio especificado: $1"
	exit
fi