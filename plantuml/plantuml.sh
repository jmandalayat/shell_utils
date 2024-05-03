#! /bin/bash

if [[ $# -ne 1 ]]
then
	echo "Modo de uso:"
	echo -e "\tplantuml <ruta al fichero UML>"
	exit

fi

if [[ -f ~/Programas/plantuml/plantuml.jar ]]
then
	java -jar "/Users/juanespinosa/Programas/plantuml/plantuml.jar" "$1"
else
	echo "\tNo se ha encontrado el ejecutable ~/Programas/plantuml/plantuml.jar"
	exit
fi