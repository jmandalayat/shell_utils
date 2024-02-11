#! /bin/bash

if [[ $# -lt 1 ]]
then
	echo "Hay que especificar un directorio"
	exit
fi

if [[ !(-d $1) ]]
then
	echo "El directorio especificado no existe"
	exit
fi

for f in $(ls $1)
do
	clear
	cat "$1$f"
	sleep 0.2s
done
