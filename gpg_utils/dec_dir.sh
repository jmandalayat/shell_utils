#! /bin/bash

# Comprobaciones de error

## Se comprueba que el formato es correcto
if [[ $# -lt 3 ]]
then

	echo "Modo de uso:"
	echo "  des-dir [ruta al fichero] [directorio de salida] [UID de la clave] [--debug]"

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

## Se comprueba si existe el fichero
if [[ ! -f $1 ]]
then

	echo "No existe el fichero especificado: $1"
	exit
fi

## Se comprueba si existe el directorio de salida
if [[ -d $2 ]]
then

	echo "Ya existe el directorio especificado: $2"
	exit
fi

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
if [[ $( echo $2 | awk '{ print substr( $0, length($0) ) }' ) == "/" ]]
then
	dirPath=$( echo $2 | awk '{ print substr( $0, 1, length($0)-1 ) }' )
else
	dirPath=$2
fi

# Fichero comprimido temporal
compressedFilePath=".temp_$dirPath"_"$(gpg --armor --gen-random 2 15 | tr -dc A-Za-z0-9).tgz"
#compressedFilePath="$dirPath.tgz"

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
#fi

# Se selecciona la contraseña
userPassword=$(grep "$3" "$GPGUTILSTABLE" | awk -F% '{ print $6 }')

# Desencriptar
gpg -d --pinentry-mode loopback --batch --passphrase "$userPassword" -o "$compressedFilePath" -v "$1"

# Crear directorio de destino
mkdir "$dirPath"

# Descomprimir
tar -C "$dirPath" -xvf "$compressedFilePath"

# Eliminar fichero comprimido
rm "$compressedFilePath"
