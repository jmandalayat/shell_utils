#! /bin/bash

echo "Usuarios locales:"
echo
cat /etc/passwd

echo
echo
echo

echo "shadow de usuarios locales:"
echo
sudo cat /etc/shadow

echo
echo
echo

echo "Grupos de usuarios locales:"
echo
cat /etc/group

echo
echo
echo

echo "shadow de grupos de usuarios locales:"
echo
sudo cat /etc/gshadow
