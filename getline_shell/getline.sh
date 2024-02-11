#! /bin/bash

if [[ $# == 2 ]]
then
	head -n $1 $2 | tail -n 1
else
	echo "Modo de uso:"
	echo "  getline [línea] [fichero]"
fi
