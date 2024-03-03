#! /bin/bash



if [[ $# != 1 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   secsync-down [lista]"
	exit
fi

if [[ ! -f $1 ]]
then
	echo "Error: No existe el fichero de lista especificado"
	echo
	echo "Modo de uso:"
	echo "   secsync-down [lista]"
	exit
fi



for gpgcipherlistline in $(cat "$1")
do
	dir_name=$(echo -n "$gpgcipherlistline" | awk -F=% '{ print $1 }')
	file_enc_path=$(echo -n "$gpgcipherlistline" | awk -F=% '{ print $2 }')
	dir_path=$(echo -n "$gpgcipherlistline" | awk -F=% '{ print $3 }')
	dir_metadata_path=$(echo -n "$gpgcipherlistline" | awk -F=% '{ print $4 }')
	file_enc_metadata_path=$(echo -n "$gpgcipherlistline" | awk -F=% '{ print $5 }')
	uid_key=$(echo -n "$gpgcipherlistline" | awk -F=% '{ print $6 }')

	if [[ -d $dir_path ]]
	then
		echo "Se va a sincronizar el directorio local con el fichero cifrado ($dir_name):"
		echo

		mustsync=""
		if [[ -f "$file_enc_metadata_path" ]]
		then
			if [[ $(ls -l "$file_enc_path" | diff -q - "$file_enc_metadata_path") ]]
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

			# Se elimina el directorio a actualizar
			if [[ -d "$dir_path" ]]
			then
				rm -r "$dir_path"
			fi

			# Se extrae el fichero comprimido y se descifra
			"$SCRIPTS/dec_dir.sh" "$file_enc_path" "$dir_path" $uid_key

			# Se actualizan los metadatos del directorio
			find "$dir_path" -type f -exec ls -l {} + > "$dir_metadata_path"

			# Se actualizan los metadatos del fichero cifrado
			ls -l "$file_enc_path" > "$file_enc_metadata_path"
		else
			echo "No se han encontrado diferencias, no se procede a la sincronización"
			echo
		fi
	else
		echo "No se va a sincronizar el directorio local con el fichero cifrado ($dir_name), no existe el directorio"
	fi
done
