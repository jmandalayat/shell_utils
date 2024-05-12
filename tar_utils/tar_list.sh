#! /bin/bash

# Comprobaciones de error

## Se comprueba que el formato es correcto
if [[ $# != 1 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   tar_list [lista]"
	exit
fi

## Se comprueba si existe el fichero de lista
if [[ ! -f $1 ]]
then
	echo "Error: No existe el fichero de lista especificado"
	exit
fi

# Se itera en las líneas del fichero de lista
for i in $(seq $(wc -l < "$1"))
do

	listLine=$(head -n $i "$1" | tail -n 1)

	dirPath=$(echo -n "$listLine" | awk -F% '{ print $1 }')
	compressedFilePath=$(echo -n "$listLine" | awk -F% '{ print $2 }')

	# Se comprueba si existe el directorio
	if [[ -d $dirPath ]]
	then

		# Formatea la ruta para hacerla más manejable
		dirPath=$(realpath $1)
		if [[ $( echo $dirPath | awk '{ print substr( $0, length($0) ) }' ) == "/" ]]
		then
			dirPath=$( echo $dirPath | awk '{ print substr( $0, 1, length($0)-1 ) }' )
		fi

		# Fichero comprimido
		compressedFilePath=$(realpath "$compressedFilePath")

		# Se comprueba si existe el fichero comprimido
		if [[ -f "$compressedFilePath" ]]
		then

			#echo "Ya existe el fichero comprimido: $compressedFilePath"
			rm "$compressedFilePath"
		fi
		
		# Comprimir sin ficheros de metadatos
		tar --exclude "._*" --exclude "*DS_Store" --exclude "*Zone.Identifier" --exclude "*:com.apple*" -C "$dirPath" -czvf "$compressedFilePath" .
	else
		echo "No existe el directorio especificado: $dirName"
	fi
done
