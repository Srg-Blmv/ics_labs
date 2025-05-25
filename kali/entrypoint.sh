#!/bin/bash


# Настройка VNC
mkdir -p /home/kali/.vnc
usermod -aG sudo kali  
echo "kali" | vncpasswd -f > /home/kali/.vnc/passwd
chown -R kali:kali /home/kali/.vnc
chmod 600 /home/kali/.vnc/passwd

# Запуск VNC сервера
su - kali -c "vncserver :1 -geometry 1920x1080 -depth 24 -localhost"

# Запуск noVNC с правильными параметрами
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 6080