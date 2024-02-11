#! /bin/bash

# Carpeta de programas
"$SCRIPTS/programas.sh"
cd ~/Programas/

# Se descarga el fichero
wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp

# Se da el permiso de ejecución
chmod u+x yt-dlp
