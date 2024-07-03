#! /bin/bash



# Herramientas básicas de red

# Tradicionales
sudo apt-get install -y iputils*
# Nuevas
sudo apt-get install -y net-tools inetutils*
# Enrutamiento
sudo apt-get install -y iptables route
# Herramientas de "sniffering" de paquetes
sudo apt-get install -y tcpdump
#sudo apt-get install -y wireshark
# Inspección de puertos
sudo apt-get install -y nmap
# Herramienta sock
#"$SCRIPTS/programas.sh"
#cd ~/Programas
#wget http://ttcplinux.sourceforge.net/tools/sock
#chmod u+x sock



# SSH

# Cliente
sudo apt-get install -y openssh-client
# Servidor
#sudo apt-get install -y openssh-server



# HTTP

# Peticiones
sudo apt-get install -y curl wget
# Servidor web
#sudo apt-get install -y apache2



# DNS

# Utilidades básicas
sudo apt-get install -y bind9-dnsutils bind9-host
# Servidor
#sudo apt-get install -y bind9 bind9-utils
# DNSRecon
#sudo apt-get install -y dnsrecon



# Tunelado (VPN)

# Clientes PPTP
sudo apt-get install -y pptp-linux
#sudo apt-get install -y network-manager-pptp
#sudo apt-get install -y network-manager-pptp-gnome
# Clientes SSTP
sudo apt-get install -y sstp-client
# Clientes OpenVPN
sudo apt-get install -y openvpn
#sudo apt-get install -y network-manager-openvpn
#sudo apt-get install -y network-manager-openvpn-gnome
# Servidor
#sudo apt-get install -y bcrelay pptpd



# LDAP

# Cliente
sudo apt-get install -y finger ldap-utils
# Servidor
#sudo apt-get install -y slapd ldapscripts ldapvi
# PAM
#sudo apt-get install -y libpam-ldapd



# NSS

#sudo apt-get install -y libnss-ldap



# NFS

#sudo apt-get install -y nfs-kernel-server nfs-common



# Sincronización

# En local
sudo apt-get install -y rsync
# En la nube
sudo apt-get install -y rclone



# Transferencia de archivos

# qBittorrent
#sudo apt-get install -y qbittorrent
# FileZilla
sudo apt-get install -y filezilla
