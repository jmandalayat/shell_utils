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
if [[ !$(gpg -k | grep $3) ]]
then

	echo "No existe la clave indicada: $3"
	exit
fi

# Se elimina el último carácter en el caso de que sea una barra
if [[ $( echo $2 | awk '{ print substr( $0, length($0) ) }' ) == "/" ]]
then

	dire=$( echo $2 | awk '{ print substr( $0, 1, length($0)-1 ) }' )
else

	dire=$2
fi

# Fichero comprimido
file="$dire.tgz"

# Se comprueba si existe el fichero comprimido
if [[ -f $file ]]
then

	echo "Ya existe el fichero comprimido: $file"
	exit
fi

# Se selecciona la contraseña
contra=$(grep "$3" "$GPGUTILSTABLE" | awk -F% '{ print $6 }')

# Desencriptar
gpg -d --pinentry-mode loopback --batch --passphrase "$contra" -o "$file" -v "$1"

# Crear directorio de destino
mkdir "$dire"

# Descomprimir
tar -C "$dire" -xvf "$file"

# Eliminar fichero comprimido
rm "$file"
