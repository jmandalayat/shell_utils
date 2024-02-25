#! /bin/bash



if [[ $# -gt 2 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   clone_down [lista] [-y]"
	exit
fi

if [[ ! -f $1 ]]
then
	echo "Error: No existe el fichero de lista especificado"
	echo
	echo "Modo de uso:"
	echo "   clone_down [lista] [-y]"
	exit
fi

if [[ $# -eq 2 && $2 != "-y" ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   clone_down [lista] [-y]"
	exit
fi

if [[ $# -eq 2 && $2 == "-y" ]]
then
	echo "Sincronización rápida habilitada (sé cauto/a con esta opción)"
	echo

	resp="y"
fi



for i in $(seq $(wc -l < "$1"))
do
	dir_name=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $1 }')
	d_nube=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $2 }')
	dir_path=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $3 }')

	if [[ -d $dir_path ]]
	then
		echo "Se va a sincronizar el sistema de ficheros con la nube ($dir_name):"
		echo

		if [[ $2 != "-y" ]]
		then
			rclone --drive-acknowledge-abuse --dry-run -P sync "$d_nube" "$dir_path"
			echo

			echo "¿Estás seguro de que deseas hacerlo?"
			read -p "(y/n): " resp
		fi

		echo
		if [[ $resp == "y" ]]
		then
			echo "Confirmado"
			rclone --drive-acknowledge-abuse -P sync "$d_nube" "$dir_path"
		elif [[ $resp == "n" ]]
		then
			echo "Cancelado por el usuario"
		else
			echo "Cancelado (respuesta inválida)"
		fi
		echo
	else
		echo "No se va a sincronizar el sistema de ficheros con la nube ($dir_name), no existe el directorio"
	fi
done
