#! /bin/bash

# ID actualizado
NEWID="???"

# Descargar clave pública de Spotify
curl -sS "https://download.spotify.com/debian/pubkey_$NEWID.gpg" | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg

# Configurar repositorios
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Instalar cliente
sudo apt-get update && sudo apt-get install spotify-client
