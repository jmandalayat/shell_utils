#!/bin/bash

echo "Moviendo el contenido de tu directorio personal en Ubuntu a tu carpeta personal:"
ls

mkdir Exportado

for elem in $(ls)
do
	if [ $elem != "Exportado" ]
	then
		cp -r $elem Exportado/
	fi
done

mv Exportado/ /mnt/c/Users/$WINDIR/

echo "Se ha movido el contenido de tu directorio personal en Ubuntu a tu carpeta personal:"
ls /mnt/c/Users/$WINDIR/Exportado
