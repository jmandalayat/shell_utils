#! /bin/bash



# Instalación de Anaconda

# Se crea el directorio de instalación
if [[ ! -d "$PROG/anaconda3" ]]
then
	mkdir -p "$PROG/anaconda3"
fi
cd "$PROG/anaconda3"

# Descarga del script
https://repo.anaconda.com/archive/Anaconda3-[versión].sh

# Permiso de ejecución
chmod u+x Anaconda3-[versión].sh

# Instalación
./Anaconda3-[versión].sh
