#! /bin/bash

# Comprobaciones de error

## Se comprueba que el formato es correcto
if [[ $# -lt 3 ]]
then

	echo "Modo de uso:"
	echo "  en-dir [ruta al directorio] [fichero de salida] [UID de la clave] [--debug]"

	exit
fi

if [[ $4 == "--debug" ]]
then

	debugMode="True"
fi

if [[ $debugMode == "True" ]]
then
	echo "Running in debug mode with:"
	echo "  1: $1"
	echo "  2: $2"
	echo "  3: $3"
fi

## Se comprueba si existe el directorio
if [[ ! -d $1 ]]
then

	echo "No existe el directorio especificado: $1"
	exit
fi

## Se comprueba si existe el fichero de salida
#if [[ -f $2 ]]
#then

#	echo "Ya existe el fichero especificado: $2"
#	exit
#fi

## Se comprueba si existe la clave
keyExists="False"
if [[ $(gpg -k | grep $3) ]]
then
	keyExists="True"
fi
if [[ $keyExists == "False" ]]
then
	echo "No existe la clave indicada: $3"
	exit
fi

# Se elimina el último carácter en el caso de que sea una barra
if [[ $( echo $1 | awk '{ print substr( $0, length($0) ) }' ) == "/" ]]
then
	dirPath=$( echo $1 | awk '{ print substr( $0, 1, length($0)-1 ) }' )
else
	dirPath=$1
fi

# Fichero comprimido temporal
compressedFilePath=".temp_$dirPath"_"$(gpg --armor --gen-random 2 15 | tr -dc A-Za-z0-9).tgz"
#compressedFilePath=$(gpg --armor --gen-random 2 15 | tr -dc A-Za-z0-9)

if [[ $debugMode == "True" ]]
then
	echo "Current parameters:"
	echo "  1: $1"
	echo "  2: $2"
	echo "  3: $3"
	echo "  keyExists: $keyExists"
	echo "  dirPath: $dirPath"
	echo "  compressedFilePath: $compressedFilePath"
	exit
fi

# Se comprueba si existe el fichero comprimido
#if [[ -f "$compressedFilePath" ]]
#then

#	echo "Ya existe el fichero comprimido: $compressedFilePath"
#	exit
#	rm "$compressedFilePath"
#fi

# Eliminar ficheros de metadatos y comprimir (varía según plataforma)
#
#if [[ $SESSION_TYPE == "Darwin$SHELL" ]]
#then
#	tar --no-mac-metadata -C "$dirPath" -czvf "$compressedFilePath" .
#else
#	if [[ $SESSION_TYPE == "wsl$SHELL" ]]
#	then
#		find "$dirPath" -name *Zone.Identifier -exec rm {} +
#	fi
#	tar -C "$dirPath" -czvf "$compressedFilePath" .
#fi

# Comprimir sin ficheros de metadatos
tar --exclude "._*" --exclude "*DS_Store" --exclude "*Zone.Identifier" --exclude "*:com.apple*" -C "$dirPath" -czvf "$compressedFilePath" .

# Encriptar
gpg -e --cipher-algo AES256 -r "$3" -o "$2" -v "$compressedFilePath"

# Eliminar fichero comprimido
rm "$compressedFilePath"
