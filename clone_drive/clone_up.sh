#! /bin/bash



if [[ $# -gt 2 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   clone_up [lista] [-y]"
	exit
fi

if [[ ! -f $1 ]]
then
	echo "Error: No existe el fichero de lista especificado"
	echo
	echo "Modo de uso:"
	echo "   clone_up [lista] [-y]"
	exit
fi

if [[ $# -eq 2 && $2 != "-y" ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   clone_up [lista] [-y]"
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
	dir_name=$(echo -n "$listline" | awk -F% '{ print $1 }')
	d_nube=$(echo -n "$listline" | awk -F% '{ print $2 }')
	dir_path=$(echo -n "$listline" | awk -F% '{ print $3 }')

	if [[ -d $dir_path ]]
	then
		echo "Se va a sincronizar la nube con el sistema de ficheros ($dir_name):"
		echo

		if [[ $2 != "-y" ]]
		then
			rclone --drive-acknowledge-abuse --dry-run -P sync "$dir_path" "$d_nube"
			echo

			echo "¿Estás seguro de que deseas hacerlo?"
			read -p "(y/n): " resp
		fi

		echo
		if [[ $resp == "y" ]]
		then
			echo "Confirmado"
			rclone --drive-acknowledge-abuse -P sync "$dir_path" "$d_nube"
		elif [[ $resp == "n" ]]
		then
			echo "Cancelado por el usuario"
		else
			echo "Cancelado (respuesta inválida)"
		fi
		echo
	else
		echo "No se va a sincronizar la nube con el sistema de ficheros ($dir_name), no existe el directorio"
	fi
done
