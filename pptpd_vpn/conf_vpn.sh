#! /bin/bash


# 1. Instalamos el paquete pptpd:
sudo apt-get install pptpd

# 2. Configuramos direcciones IP
sudo nano /etc/pptpd.conf

# 3. Configuramos el servidor de nombres
sudo nano /etc/ppp/pptpd-options

# 4. Configuramos unas credenciales
sudo nano /etc/ppp/chap-secrets

# 5. Arrancamos el servidor
sudo service pptpd start

# 6. Permitimos el reencaminamiento
sudo nano /etc/sysctl.conf
sudo sysctl -p

# 7. Añadimos una ruta
sudo iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE

# 8. Cambiamos el tamaño del MSS
sudo iptables -A FORWARD -p tcp --syn -s 192.168.1.0/24 -j TCPMSS --set-mss aaa

# 9. Solo queda configurar el cliente
