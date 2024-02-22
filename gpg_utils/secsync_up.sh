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
	d_nombre=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $1 }')
	f_nube=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $2 }')
	f_cifra=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $3 }')
	d_cifra=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $4 }')
	d_local=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $5 }')
	uid_clave=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $6 }')

	if [[ -d $d_local ]]
	then
		echo "Se va a sincronizar el fichero cifrado con el directorio local ($d_nombre):"
		echo

		if [[ ! -d $d_cifra ]]
		then
			mkdir $d_cifra
		fi

		if [[ $(diff -qr "$d_local" "$d_cifra") ]]
		then
			echo "Se han encontrado diferencias, se procede a la sincronización"
			echo

			# Se sincronizan los directorios
			rsync --progress -aP --delete "$d_local" "$d_cifra"

			# Se elimina el fichero cifrado actual
			if [[ -f "$f_cifra" ]]
			then
				rm "$f_cifra"
			fi

			echo "Se procede a la creación del fichero cifrado"
			echo

			# Se comprime y cifra el directorio
			"$SCRIPTS/enc_dir.sh" "$d_cifra" "$f_cifra" $uid_clave

			# Se comprueba si se ha cifrado el fichero
			if [[ ! -f "$f_cifra" ]]
			then
				echo "No se ha podido cifrar el directorio: $d_nombre"
				exit
			fi

			# Se copia en el directorio sincronizado
			cp "$f_cifra" "$f_nube"
		else
			echo "No se han encontrado diferencias, no se procede a la sincronización"
			echo
		fi
	else
		echo "No se va a sincronizar el fichero cifrado con el directorio local ($d_nombre), no existe el directorio"
	fi
done
