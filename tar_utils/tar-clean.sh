#! /bin/bash

# Comprobaciones de error

## Se comprueba que el formato es correcto
if [[ $# != 1 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "  tar_clean [ruta al directorio]"
	exit
fi

## Se comprueba si existe el directorio
if [[ ! -d $1 ]]
then
	echo "No existe el directorio especificado: $1"
	exit
fi

# Formatea la ruta para hacerla más manejable
dirPath=$(realpath $1)
if [[ $( echo $dirPath | awk '{ print substr( $0, length($0) ) }' ) == "/" ]]
then
	dirPath=$( echo $dirPath | awk '{ print substr( $0, 1, length($0)-1 ) }' )
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