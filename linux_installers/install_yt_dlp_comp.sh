#! /bin/bash

# Compilación
sudo apt-get install -y python3 zip make pandoc

# Strongly recommended
sudo apt-get install -y ffmpeg ffprobe

# Networking
sudo apt-get install -y certifi brotli brotlicffi websockets

# Metadata
sudo apt-get install -y mutagen atomicparsley xattr pyxattr setfattr

# Misc
sudo apt-get install -y pycryptodomex phantomjs secretstorage

# Carpeta de programas
"$SCRIPTS/programas.sh"
cd ~/Programas/

# Se clona el repositorio y se cambia el nombre
git clone https://github.com/yt-dlp/yt-dlp
mv yt-dlp/ temp/

# Se compila el programa
make -C temp/

# Se reubica el programa compilado y se borra el repositorio clonado
mv temp/yt-dlp ./
rm -r temp/
