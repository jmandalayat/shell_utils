#! /bin/bash

echo "Desinstalando paquetes de Wine"
sudo apt-get purge wine

echo "Eliminando el directorio principal de Wine ($HOME/.wine/)"
if [[ -d "$HOME/.wine/" ]]
then
	rm -r "$HOME/.wine/"
	echo "Se ha eliminado el directorio principal de Wine"
else
	echo "No existe el direcotrio $HOME/.wine/"
fi

echo "Eliminando atajos de menú de Wine ($HOME/.local/share/applications/wine/)"
if [[ -d "$HOME/.local/share/applications/wine/" ]]
then
	rm -r "$HOME/.local/share/applications/wine/"
	echo "Se han eliminado los atajos de mwnú de Wine"
else
	echo "No existe el direcotrio $HOME/.local/share/applications/wine/"
fi
