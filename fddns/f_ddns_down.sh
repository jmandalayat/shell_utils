#! /bin/bash

# Bajar archivo cifrado
rclone -P copy GD_Personal_Rclone:quiensabe.gpg $HOME/Documentos/

# Descifrar archivo
gpg --yes -o $HOME/Documentos/ext_p_ip_hist.txt -d $HOME/Documentos/quiensabe.gpg

# Eliminar archivo
rm $HOME/Documentos/quiensabe.gpg
