#! /bin/bash



if [[ $# != 1 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   cifra_down [lista]"
	exit
fi

if [[ ! -f $1 ]]
then
	echo "Error: No existe el fichero de lista especificado"
	echo
	echo "Modo de uso:"
	echo "   cifra_down [lista]"
	exit
fi



for i in $(seq $(wc -l < "$1"))
do
	d_nombre=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $1 }')
	f_nube=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $2 }')
	f_cifra=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $3 }')
	d_cifra=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $4 }')
	d_local=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $5 }')
	no_clave=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $6 }')

	if [[ -d $d_local ]]
	then
		echo "Se va a sincronizar el directorio local con el fichero cifrado ($d_nombre):"
		echo

		if [[ $(diff -qr "$f_nube" "$f_cifra") ]]
		then
			echo "Se han encontrado diferencias, se procede a la sincronización"
			echo

			# Se elimina el directorio a actualizar
			if [[ -d "$d_cifra" ]]
			then
				rm -r "$d_cifra"
			fi

			# Se copia el fichero
			cp "$f_nube" "$f_cifra"

			# Se extrae el fichero comprimido y se descifra
			"$SCRIPTS/des_dir.sh" "$f_cifra" "$d_cifra" $no_clave

			echo "Se procede a la sincronización"
			echo

			# Se sincronizan los directorios
			rsync --progress -aP --delete "$d_cifra" "$d_local"
		else
			echo "No se han encontrado diferencias, no se procede a la sincronización"
			echo
		fi
	else
		echo "No se va a sincronizar el directorio local con el fichero cifrado ($d_nombre), no existe el directorio"
	fi
done
