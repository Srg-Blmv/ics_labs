FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# Установка GUI, VNC и noVNC
RUN apt-get update && apt-get install -y \
    kali-desktop-xfce tightvncserver novnc websockify dbus-x11 x11-xserver-utils sudo nmap ettercap-text-only\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Создание пользователя
RUN useradd -m -s /bin/bash kali && \
    echo 'kali:kali' | chpasswd  

COPY ./entrypoint.sh /tmp/entrypoint.sh

RUN chmod +x /tmp/entrypoint.sh

CMD ["/usr/bin/bash", "/tmp/entrypoint.sh"]

