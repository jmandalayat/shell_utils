#! /bin/bash



# Se comprueba que el formato es correcto

if [[ $# != 3 ]]
then

	echo "Modo de uso:"
	echo "  en-dir [ruta al directorio] [fichero de salida] [número de la clave]"

	exit
fi



# Se comprueba si existe el directorio

if [[ ! -d $1 ]]
then

	echo "No existe el directorio especificado: $1"
	exit
fi



# Se comprueba si existe el fichero de salida

if [[ -f $2 ]]
then

	echo "Ya existe el fichero especificado: $2"
	exit
fi



# Se elimina el último carácter en el caso de que sea una barra

if [[ $( echo $1 | awk '{ print substr( $0, length($0) ) }' ) == "/" ]]
then

	dire=$( echo $1 | awk '{ print substr( $0, 1, length($0)-1 ) }' )
else

	dire=$1
fi



# Fichero comprimido

file="$dire.tgz"



# Se comprueba si existe el fichero comprimido

if [[ -f $file ]]
then

	echo "Ya existe el fichero comprimido: $file"
	exit
fi



# Se selecciona la clave

case $3 in
	1)
		GPG_K=$GPG_K_1
	;;
	2)
		GPG_K=$GPG_K_2
	;;
	3)
		GPG_K=$GPG_K_3
	;;
	*)
		echo "Solo se han habilitado tres claves en este sistema"
		exit
	;;
esac



# Se comprueba si está definida la clave

if [[ -z $GPG_K ]]
then

	echo "No hay definida una clave para cifrar/descifrar"
	exit
fi



# Comprimir

tar -C "$dire" -czvf "$file" .



# Encriptar

gpg -e --cipher-algo AES256 -r $GPG_K -o "$2" -v "$file"



# Eliminar fichero comprimido

rm "$file"
