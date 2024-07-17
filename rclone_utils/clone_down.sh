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

	listLine=$(head -n $i "$1" | tail -n 1)

	dirName=$(echo -n "$listLine" | awk -F% '{ print $1 }')
	dirCloud=$(echo -n "$listLine" | awk -F% '{ print $2 }')
	dirPath=$(echo -n "$listLine" | awk -F% '{ print $3 }')

	if [[ -d $dirPath ]]
	then
		echo "Se va a sincronizar el sistema de ficheros con la nube ($dirName):"
		echo

		if [[ $2 != "-y" ]]
		then
			rclone --drive-acknowledge-abuse --dry-run -P sync "$dirCloud" "$dirPath"
			echo

			echo "¿Estás seguro de que deseas hacerlo?"
			read -p "(y/n): " resp
		fi

		echo
		if [[ $resp == "y" ]]
		then
			echo "Confirmado"
			rclone --drive-acknowledge-abuse -P sync "$dirCloud" "$dirPath"
		elif [[ $resp == "n" ]]
		then
			echo "Cancelado por el usuario"
		else
			echo "Cancelado (respuesta inválida)"
		fi
		echo
	else
		echo "No se va a sincronizar el sistema de ficheros con la nube ($dirName), no existe el directorio"
	fi
done
