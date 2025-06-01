FROM debian:bookworm-slim

# Установка зависимостей
RUN apt-get update && apt-get install -y  \
    git sudo python3 



# Клонирование и установка OpenPLC
RUN git clone https://github.com/thiagoralves/OpenPLC_v3.git /home/openplc && \
    cd /home/openplc && \
    ./install.sh docker && \ 
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /home/openplc

#Копирование пользовательских файлов
COPY ./plc.st /home/openplc/webserver/st_files/plc.st
COPY ./openplc.db /home/openplc/webserver/openplc.db
COPY ./active_program /home/openplc/webserver/active_program    

ENV OPENPLC_PLATFORM=linux
RUN cd /home/openplc/webserver/scripts  && ./compile_program.sh plc.st
CMD ["/home/openplc/start_openplc.sh"]
