#! /bin/bash



if [[ $# != 2 ]]
then
	echo "Error: Entrada inválida"
	echo
	echo "Modo de uso:"
	echo "   sym [lista] [lugar donde depositar los enlaces]"
	exit
fi

if [[ ! -f $1 ]]
then
	echo "Error: No existe el fichero de lista especificado"
	echo
	echo "Modo de uso:"
	echo "   sym [lista] [lugar donde depositar los enlaces]"
	exit
fi



for i in $(seq $(wc -l < "$1"))
do
	enlace=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $1 }')
	enlace=${enlace//'#casa'/$HOME}
	destino=$(head -n $i "$1" | tail -n 1 | awk -F% '{ print $2 }')
	destino=${destino//'#casa'/$HOME}

	if [[ -a $destino ]]
	then

		if [[ -a $2$enlace ]]
		then
			echo "Ya existe un enlace en $2$enlace"
		else
			echo "Creando enlace a $destino en $2$enlace"
			ln -s "$destino" "$2$enlace"
		fi
	else
		echo "No existe $destino"
	fi
done
