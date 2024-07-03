#! /bin/bash

# Actualizar historial de IP pública
./act_p_ip_hist.sh

# Cifrar historial de IP pública
gpg --yes -o $HOME/GDrive/Rclone/quiensabe.gpg -e --cipher-algo AES256 -r juan@man.es $P_IP_HIST

# Subir archivo cifrado
rclone -P sync $HOME/GDrive/Rclone/ GD_Personal_Rclone:
