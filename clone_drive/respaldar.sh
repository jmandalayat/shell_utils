#! /bin/bash



if [[ $# -gt 2 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   respaldar [lista] [-y]"
	exit
fi

if [[ ! -f $1 ]]
then
	echo "Error: No existe el fichero de lista especificado"
	echo
	echo "Modo de uso:"
	echo "   respaldar [lista] [-y]"
	exit
fi

if [[ $# -eq 2 && $2 != "-y" ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   respaldar [lista] [-y]"
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
	dirOrigin=$(echo -n "$listLine" | awk -F% '{ print $2 }')
	dirDestination=$(echo -n "$listLine" | awk -F% '{ print $3 }')

	echo "Se va a sincronizar una ubicación en la nube con la otra ($dirName):"
	echo

	if [[ $2 != "-y" ]]
	then
		rclone --drive-acknowledge-abuse --dry-run -P sync "$dirOrigin" "$dirDestination"
		echo

		echo "¿Estás seguro de que deseas hacerlo?"
		read -p "(y/n): " resp
	fi

	echo
	if [[ $resp == "y" ]]
	then
		echo "Confirmado"
		rclone --drive-acknowledge-abuse -P sync "$dirOrigin" "$dirDestination"
	elif [[ $resp == "n" ]]
	then
		echo "Cancelado por el usuario"
	else
		echo "Cancelado (respuesta inválida)"
	fi
	echo
done
