#! /bin/bash

if [[ -z $IT_NIA ]]
then

	echo "No se ha definido un usuario de IT en la variable IT_NIA"
	exit
fi

if [[ $# == 1 ]]
then
	sftp "$IT_NIA@$1.lab.it.uc3m.es"
elif [[ $# == 2 ]]
then
	sftp "$IT_NIA@$1.lab.it.uc3m.es" $2
else
	echo "Modo de uso:"
	echo "  lab_it_ftp [máquina del departamento de IT] [opción]"
	echo
	echo "Máquinas disponibles:"
	echo "  it[000-036]"
	echo "  vit[001-140]"
	echo "  doc[000-036]"
	echo "  monitor[01-06]"
fi
