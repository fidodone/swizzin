#!/bin/bash
username=$(cut -d: -f1 < /root/.master.info)
docker stop monitor
docker rm monitor

systemctl stop -q monitor@${username}
systemctl disable -q monitor@${username}
rm /etc/systemd/system/monitor@.service

rm -rf /home/$username/.config/monitor
rm /install/.monitor.lock
rm -f /etc/nginx/apps/monitor.conf

systemctl reload nginx

