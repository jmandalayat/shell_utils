#! /bin/bash



if [[ $# != 1 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   cifra_up [lista]"
	exit
fi

if [[ ! -f $1 ]]
then
	echo "Error: No existe el fichero de lista especificado"
	echo
	echo "Modo de uso:"
	echo "   cifra_up [lista]"
	exit
fi



for i in $(seq $(wc -l < "$1"))
do
	dir_name=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $1 }')
	file_enc_path=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $2 }')
	dir_path=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $3 }')
	dir_metadata_path=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $4 }')
	file_enc_metadata_path=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $5 }')
	uid_key=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $6 }')

	if [[ -d $dir_path ]]
	then
		echo "Se va a sincronizar el fichero cifrado con el directorio local ($dir_name):"
		echo

		if [[ $(diff -q $(find "$dir_path" -type f -exec ls -l {} +) "$dir_metadata_path" ) ]]
		then
			echo "Se han encontrado diferencias, se procede a la sincronización"
			echo

			# Se actualizan los metadatos del directorio
			find "$dir_path" -type f -exec ls -l {} + > "$dir_metadata_path"

			# Se comprime y cifra el directorio
			"$SCRIPTS/enc_dir.sh" "$dir_path" "$file_enc_path" "$uid_key"

			# Se actualizan los metadatos del fichero cifrado
			ls -l "$file_enc_path" > "$file_enc_metadata_path"
		else
			echo "No se han encontrado diferencias, no se procede a la sincronización"
			echo
		fi
	else
		echo "No se va a sincronizar el fichero cifrado con el directorio local ($dir_name), no existe el directorio"
	fi
done
