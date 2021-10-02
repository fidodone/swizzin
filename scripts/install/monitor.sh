#!/bin/bash
#
# monitor installer
#
# Author     :   QuickBox.IO | fidodone
# Ported to swizzin by liara
#
# QuickBox Copyright (C) 2017 QuickBox.io
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#    You may copy, distribute and modify the software as long as you track
#    changes/dates in source files. Any modifications to our software
#    including (via compiler) GPL-licensed code must also be made available
#    under the GPL along with build & install instructions.
#
if [[ -f /tmp/.install.lock ]]; then
    log="/root/logs/install.log"
else
    log="/root/logs/swizzin.log"
fi

username=$(cut -d: -f1 < /root/.master.info)
user=$(cut -d: -f1 < /root/.master.info)
qbit="/home/$username/torrents/upload"
rut="/home/$username/torrents/upload"
config="/home/$username/.config/monitor"
logfolder="/home/$username/.config/monitor"

echo "Iniciando a instalação do Monitor de Upload"
sudo mkdir -p "$config" # Criando a pasta de configração pro monitor
sudo chown "$username":"$username" "$config"

isactive=$(systemctl is-active docker) # Verificando se o sistema ja tem o docker instalado

if [[ $isactive == "active" ]]; then
    echo "Ativando o serviço do Monitor"
    docker run -d --name monitor -e "PUID=`id -u $username`" -e "PGID=`id -g $username`" -p 8555:80 -v "$logfolder":/log -v "$config":/var/www/html --restart=unless-stopped richarvey/nginx-php-fpm:1.10.3 >>"${log}" 2>&1
else
    sudo curl -fsSl https://get.docker.com | bash >>"${log}" 2>&1
    echo "Ativando o serviço do Monitor"
    docker run -d --name monitor -e "PUID=`id -u $username`" -e "PGID=`id -g $username`" -p 8555:80 -v "$logfolder":/log -v "$config":/var/www/html --restart=unless-stopped richarvey/nginx-php-fpm:1.10.3 >>"${log}" 2>&1
fi

echo "Configurando o HTML do Monitor de Upload"
sudo cp /etc/swizzin/html/index.php "$config/"
sudo sed -i "s|USER|$username|g" "$config/index.php"

echo "Verificando qual programa de torrent está instalado"
if [[ ! -e /root/qbt && ! -e /root/rt ]]; then
    echo "Não encontrei programa de torrent instalado na maquina"
    exit
else
    echo "--- Copiando Script... ---"

    cp /etc/swizzin/html/move.sh "$config/$username.sh"
    sudo chmod +x "$config/$username.sh"
    sudo chown -R "$username":"$username" "$config"
    echo " Instalando Serviço de Upload para $username "

    cat > /etc/systemd/system/monitor@.service <<SERVICE
[Unit]
Description=Move Service Daemon
After=multi-user.target

[Service]
Type=simple
User=%i
Group=%i
ExecStart=/bin/bash /home/%i/.config/monitor/%i.sh
KillMode=process

[Install]
WantedBy=multi-user.target
SERVICE

    #cp /etc/swizzin/systemd/move.service /etc/systemd/system/monitor@.service
    sed -i "s|PASTADELOG|"$logfolder/$username.log"|g" "$config/$username.sh"
    sed -i "s|USER|$username|g" "$config/$username.sh"

    if [[ -e /root/qbt ]]; then
        echo "--- Configurando o sistema de Upload para o Qbittorrent ---"
        sed -i "s|LOCAL|$qbit|g" "$config/$username.sh" # Renomeando pasta de upload conforme programa escolhido
    elif [[ -e /root/rt ]]; then
        echo "--- Configurando o sistema de Upload para o ruTorrent ---"
        sed -i "s|LOCAL|$rut|g" "$config/$username.sh" # Renomeando pasta de upload conforme programa escolhido
        echo "--- Criando pasta de upload ... ---"
        sudo mkdir -p /home/"$username"/torrents/upload
        sudo chown -R "$username":"$username" /home/"$username"/torrents/upload
        sudo chmod -R 775 /home/"$username"/torrents/upload
    fi
        echo "--- Serviço de upload copiado! ---"
        echo "--- Atualizando Daemon-reload! ---"
        sudo systemctl daemon-reload
        echo "--- Ativando Serviço! ---"
        sudo systemctl enable monitor@"${user}" | sudo tee -a "${log}" 2>&1
        echo "--- Serviço de upload copiado e ativado! ---"
fi



if [[ -f /install/.nginx.lock ]]; then
    sleep 1
    bash /usr/local/bin/swizzin/nginx/monitor.sh
    systemctl reload nginx
fi

touch /install/.monitor.lock

echo "monitor Install Complete!"


###################################################################################
