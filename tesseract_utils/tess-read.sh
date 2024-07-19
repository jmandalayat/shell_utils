#! /bin/bash

if [[ $# -ne 1 ]]
then
	echo "Modo de uso:"
	echo -e "\tleer <ruta a la imagen>"
else
	tesseract $1 -
fi
