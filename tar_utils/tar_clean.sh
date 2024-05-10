#! /bin/bash

# Se comprueba si existe el directorio
if [[ ! -d $1 ]]
then

	echo "No existe el directorio especificado: $1"
	exit
fi

# Se elimina el último carácter en el caso de que sea una barra
if [[ $( echo $1 | awk '{ print substr( $0, length($0) ) }' ) == "/" ]]
then
	dirPath=$( echo $1 | awk '{ print substr( $0, 1, length($0)-1 ) }' )
else
	dirPath=$1
fi

# Fichero comprimido
compressedFilePath="$dirPath.tgz"

# Se comprueba si existe el fichero comprimido
if [[ -f "$compressedFilePath" ]]
then

	#echo "Ya existe el fichero comprimido: $compressedFilePath"
	rm "$compressedFilePath"
fi

# Comprimir sin ficheros de metadatos
tar --exclude "._*" --exclude "*DS_Store" --exclude "*Zone.Identifier" --exclude "*:com.apple*" -C "$dirPath" -czvf "$compressedFilePath" .