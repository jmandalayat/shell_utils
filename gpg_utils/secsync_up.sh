#! /bin/bash



if [[ $# != 1 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   secsync-up [lista]"
	exit
fi

if [[ ! -f $1 ]]
then
	echo "Error: No existe el fichero de lista especificado"
	echo
	echo "Modo de uso:"
	echo "   secsync-up [lista]"
	exit
fi



for i in $(seq $(wc -l < "$1"))
do

	listLine=$(head -n $i "$1" | tail -n 1)
	
	dirName=$(echo -n "$listLine" | awk -F% '{ print $1 }')
	encryptedFilePath=$(echo -n "$listLine" | awk -F% '{ print $2 }')
	dirPath=$(echo -n "$listLine" | awk -F% '{ print $3 }')
	dirMetadataPath=$(echo -n "$listLine" | awk -F% '{ print $4 }')
	encryptedFileMetadataPath=$(echo -n "$listLine" | awk -F% '{ print $5 }')
	keyUID=$(echo -n "$listLine" | awk -F% '{ print $6 }')

	if [[ -d $dirPath ]]
	then
		echo "Se va a sincronizar el fichero cifrado con el directorio local ($dirName):"
		echo

		mustsync=""
		if [[ -f "$dirMetadataPath" ]]
		then
			if [[ $(find "$dirPath" -type f -exec ls -l {} + | diff -q - "$dirMetadataPath") ]]
			then
				mustsync="1"
			fi
		else
			mustsync="1"
		fi

		if [[ "$mustsync" ]]
		then
			echo "Se han encontrado diferencias, se procede a la sincronización"
			echo

			# Se elimina el fichero a actualizar
			if [[ -f "$encryptedFilePath" ]]
			then
				rm "$encryptedFilePath"
			fi

			# Se comprime y cifra el directorio
			"$SCRIPTS/enc_dir.sh" "$dirPath" "$encryptedFilePath" "$keyUID"

			# Se actualizan los metadatos del directorio
			find "$dirPath" -type f -exec ls -l {} + > "$dirMetadataPath"

			# Se actualizan los metadatos del fichero cifrado
			ls -l "$encryptedFilePath" > "$encryptedFileMetadataPath"
		else
			echo "No se han encontrado diferencias, no se procede a la sincronización"
			echo
		fi
	else
		echo "No se va a sincronizar el fichero cifrado con el directorio local ($dirName), no existe el directorio"
	fi
done
