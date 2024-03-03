#! /bin/bash

# Comprobaciones de error

## Se comprueba que el formato es correcto
if [[ $# != 3 ]]
then

	echo "Modo de uso:"
	echo "  des-dir [ruta al fichero] [directorio de salida] [UID de la clave]"

	exit
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
if [[ $( echo $2 | awk '{ print substr( $0, length($0) ) }' ) == "/" ]]
then

	dir_path=$( echo $2 | awk '{ print substr( $0, 1, length($0)-1 ) }' )
else

	dir_path=$2
fi

# Fichero comprimido
compressedfile="$dir_path.tgz"

# Se comprueba si existe el fichero comprimido
if [[ -f "$compressedfile" ]]
then

	echo "Ya existe el fichero comprimido: $compressedfile"
	exit
fi

# Se selecciona la contraseña
contra=$(grep "$3" "$GPGUTILSTABLE" | awk -F=% '{ print $6 }')

# Desencriptar
gpg -d --pinentry-mode loopback --batch --passphrase "$contra" -o "$compressedfile" -v "$1"

# Crear directorio de destino
mkdir "$dir_path"

# Descomprimir
tar -C "$dir_path" -xvf "$compressedfile"

# Eliminar fichero comprimido
rm "$compressedfile"
