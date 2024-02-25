#! /bin/bash

# Comprobaciones de error

## Se comprueba que el formato es correcto
if [[ $# != 3 ]]
then

	echo "Modo de uso:"
	echo "  en-dir [ruta al directorio] [fichero de salida] [UID de la clave]"

	exit
fi

## Se comprueba si existe el directorio
if [[ ! -d $1 ]]
then

	echo "No existe el directorio especificado: $1"
	exit
fi

## Se comprueba si existe el fichero de salida
if [[ -f $2 ]]
then

	echo "Ya existe el fichero especificado: $2"
	exit
fi

## Se comprueba si existe la clave
keyexists="False"
if [[ $(gpg -k | grep $3) ]]
then
	keyexists="True"
fi
if [[ $keyexists == "False" ]]
then
	echo "No existe la clave indicada: $3"
	exit
fi

# Se elimina el último carácter en el caso de que sea una barra
if [[ $( echo $1 | awk '{ print substr( $0, length($0) ) }' ) == "/" ]]
then

	dir_path=$( echo $1 | awk '{ print substr( $0, 1, length($0)-1 ) }' )
else

	dir_path=$1
fi

# Fichero comprimido
compressedfile="$dir_path.tgz"

# Se comprueba si existe el fichero comprimido
if [[ -f "$compressedfile" ]]
then

	echo "Ya existe el fichero comprimido: $compressedfile"
	exit
fi

# Comprimir
tar -C "$dir_path" -czvf "$compressedfile" .

# Encriptar
gpg -e --cipher-algo AES256 -r $3 -o "$2" -v "$compressedfile"

# Eliminar fichero comprimido
rm "$compressedfile"
