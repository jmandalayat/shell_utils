#! /bin/bash

REP_LIST=$(ls "$HOME/Repositorios")

for REP in $REP_LIST
do
	echo "Descargando cambios en [$REP]"
	cd "$HOME/Repositorios/$REP"
	git pull
	echo
done
