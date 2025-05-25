#!/bin/bash

# # Ждём запуска веб-сервера (например, порт 8080)
# echo "⏳ Ждём старта web-интерфейса..."
# until curl -s http://localhost:8080 > /dev/null; do
#     sleep 1
# done

cd /home/openplc/webserver/scripts
./compile_program.sh plc.st


